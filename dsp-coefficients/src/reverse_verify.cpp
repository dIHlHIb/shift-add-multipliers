// Independent penultimate-helper join. This verifier uses only isolated single-target cuts.
// Direct signed rotations test feasible gates; repeated parents use forward addition too.
#include <algorithm>
#include <cstdint>
#include <fstream>
#include <iostream>
#include <map>
#include <stdexcept>
#include <unordered_map>
#include <vector>
using Word=uint32_t;using V=std::vector<Word>;
static bool contains(const V& v,Word x){return std::find(v.begin(),v.end(),x)!=v.end();}
class Verify{
    int p;Word M;
    V label,orbit,wanted,rawMask,bitAt,cutbit,cuts,unary,activeMask,unaryKeys,mark;
    Word goal,full,epoch=0;
    std::unordered_map<uint64_t,V> birthCache;
    std::unordered_map<Word,V> arcCache;
    V tempArc,scratch,changed;
    unsigned shift;
    uint64_t branches=0,pairs=0,tests=0;
    V answer;
    Word twice(Word x)const{Word d=2*x;return d>=M?d-M:d;}
    template<typename Fn>void each_sum(Word a,Word b,Fn f)const{
        for(int k=0;k<p;++k,b=twice(b)){
            Word sum=a+b,diff=a+M-b;f(sum>=M?sum-M:sum);f(diff>=M?diff-M:diff);}
    }
    Word direct_mask(Word a,Word b)const{Word z=0;each_sum(label[a],label[b],[&](Word v){z|=rawMask[v];});return z;}
    Word cut_mask(Word bits)const{Word z=0;while(bits){z|=cutbit[__builtin_ctz(bits)];bits&=bits-1;}return z;}
    V expansion(Word a,Word b)const{
        V v;each_sum(label[a],label[b],[&](Word x){v.push_back(orbit[x]);});
        std::sort(v.begin(),v.end());v.erase(std::unique(v.begin(),v.end()),v.end());return v;
    }
    static uint64_t key(Word a,Word b){return (uint64_t(std::min(a,b))<<32)|std::max(a,b);}
    V births(const V& available){
        V ns;Word tick=++epoch;
        for(Word x:available)mark[x]=tick;mark[0]=tick;
        auto add=[&](Word z){if(mark[z]!=tick){mark[z]=tick;ns.push_back(z);}};
        for(size_t i=0;i<available.size();++i)for(size_t j=0;j<=i;++j){
            auto a=available[i],b=available[j];auto it=birthCache.find(key(a,b));
            if(it!=birthCache.end())for(auto h:it->second)add(h);
            else each_sum(label[a],label[b],[&](Word x){add(orbit[x]);});
        }
        std::sort(ns.begin(),ns.end());return ns;
    }
    Word close(V& available){
        Word mask=0;for(auto v:available)mask|=bitAt[v];
        V pending=available; // Process each newly inserted parent against all already visited parents.
        V prior;
        for(size_t k=0;k<pending.size();++k){
            Word a=pending[k];prior.push_back(a);
            for(Word b:prior){Word fresh=direct_mask(a,b)&~mask;mask|=fresh;
                while(fresh){Word t=wanted[__builtin_ctz(fresh)];pending.push_back(t);fresh&=fresh-1;}}
            if(mask==goal)break;
        }
        available=std::move(pending);return mask;
    }
    void arcs(Word u,V& result){
        changed.clear();
        for(size_t j=0;j<cuts.size();++j){
            Word flag=Word(1)<<j;
            each_sum(label[u],label[cuts[j]],[&](Word x){Word v=orbit[x];if(!scratch[v])changed.push_back(v);scratch[v]|=flag;});
        }
        result.clear();result.reserve(changed.size());
        for(Word v:changed){result.push_back((v<<shift)|scratch[v]);scratch[v]=0;}
    }
    const V& partners(Word u){
        auto old=arcCache.find(u);if(old!=arcCache.end())return old->second;
        if(arcCache.size()<28000){auto it=arcCache.emplace(u,V{}).first;arcs(u,it->second);return it->second;}
        arcs(u,tempArc);return tempArc;
    }
    bool last_two(const V& avail,const V& assigned){
        ++branches;Word covered=0;
        V changedKeys;
        for(size_t i=0;i<assigned.size();++i){Word h=assigned[i];covered|=unary[h];
            for(size_t k=0;k<i;++k)covered|=cut_mask(direct_mask(h,assigned[k]));
            V ls;arcs(h,ls);
            for(Word z:ls){Word v=z>>shift;if(activeMask[v]==unary[v])changedKeys.push_back(v);activeMask[v]|=z&full;}
        }
        std::map<Word,V> pure;
        for(Word u:births(avail)){
            ++pairs;Word missing=full&~(covered|activeMask[u]);V possibleLast,after;
            bool opened=false;
            auto actual=[&](Word v,bool tryAll=false){
                ++tests;
                if(!opened){
                    after=avail;after.push_back(u);
                    if(close(after)==goal){answer=assigned;answer.push_back(u);return true;}
                    possibleLast=births(after);opened=true;
                }
                auto finish=[&](Word h){V g=after;g.push_back(h);if(close(g)!=goal)return false;
                    answer=assigned;answer.insert(answer.end(),{u,h});return true;};
                if(tryAll){for(auto h:possibleLast)if(finish(h))return true;return false;}
                return std::binary_search(possibleLast.begin(),possibleLast.end(),v)&&finish(v);
            };
            if(!missing){if(actual(0,true))return true;continue;}
            auto it=pure.find(missing);
            if(it==pure.end()){
                V ok;for(Word v:unaryKeys)if((activeMask[v]&missing)==missing)ok.push_back(v);
                for(Word v:changedKeys)if(!unary[v]&&(activeMask[v]&missing)==missing)ok.push_back(v);
                it=pure.emplace(missing,std::move(ok)).first;
            }
            for(Word v:it->second)if(actual(v))return true;
            // If v needs an interaction with u, enumerate every possible partner of u
            // for every isolated target. Do not use a one-missing-bit or exceptional-pair shortcut.
            for(Word edge:partners(u)){
                Word v=edge>>shift;
                if(((edge|activeMask[v])&missing)==missing&&actual(v))return true;
            }
        }
        for(Word v:changedKeys)activeMask[v]=unary[v];
        return false;
    }
    bool dfs(V avail,V assigned,int left){
        if(close(avail)==goal){answer=assigned;return true;}
        if(left==2)return last_two(avail,assigned);
        for(Word u:births(avail)){auto a=avail,h=assigned;a.push_back(u);h.push_back(u);if(dfs(a,h,left-1))return true;}
        return false;
    }
public:
    Verify(int period,const V& T):p(period),M((Word(1)<<p)-1),orbit(M+1),rawMask(M+1){
        if(p<3||p>23)throw std::runtime_error("use periods 3..23");
        label.push_back(0);
        for(Word x=1;x<M;++x)if(!orbit[x]){Word id=label.size();label.push_back(x);Word y=x;
            do {orbit[y]=orbit[M-y]=id;y=twice(y);}while(y!=x);}
        for(Word t:T){Word id=orbit[t%M];if(id>1&&!contains(wanted,id))wanted.push_back(id);}
        if(wanted.size()>=31)throw std::runtime_error("too many distinct targets");
        bitAt.resize(label.size());goal=(Word(1)<<wanted.size())-1;
        for(size_t i=0;i<wanted.size();++i)bitAt[wanted[i]]=Word(1)<<i;
        for(Word x=0;x<M;++x)rawMask[x]=bitAt[orbit[x]];
        V base=wanted;base.push_back(1);cutbit.resize(wanted.size());
        for(size_t i=0;i<wanted.size();++i){auto t=wanted[i];Word flag=Word(1)<<i;bool external=false;
            for(Word a:base)for(Word b:base)if(a!=t&&b!=t&&a<=b&&(direct_mask(a,b)&flag))external=true;
            if(!external){cutbit[i]=Word(1)<<cuts.size();cuts.push_back(t);}}
        shift=cuts.size();full=(Word(1)<<shift)-1;if(!shift||uint64_t(label.size())<<shift>UINT32_MAX)throw std::runtime_error("invalid cut packing");
        unary.resize(label.size());scratch.resize(label.size());mark.resize(label.size());
        for(Word v=0;v<label.size();++v){
            // A target cannot help to generate itself before its first occurrence.
            Word mask=direct_mask(v,v);
            for(Word a:base)mask|=direct_mask(v,a)&~bitAt[a];
            unary[v]=cut_mask(mask);if(unary[v])unaryKeys.push_back(v);
        }
        activeMask=unary;
        for(Word a:base)for(Word b:base)if(a<=b)birthCache.emplace(key(a,b),expansion(a,b));
    }
    void run(int r){
        bool fit=dfs({1},{},r);
        std::cout<<(fit?"POSSIBLE":"IMPOSSIBLE")<<" p "<<p<<" budget "<<r<<" isolated "<<cuts.size()<<" prefixes "<<branches<<" penultimate "<<pairs<<" candidates "<<tests<<" helpers";
        for(auto id:answer)std::cout<<" "<<label[id];std::cout<<"\n";
    }
};
int main(int argc,char**argv){
    if(argc<4)return 2;int p=std::stoi(argv[1]),r=std::stoi(argv[2]);V T;
    for(int i=3;i<argc;++i)T.push_back(std::stoul(argv[i]));
    Verify v(p,T);v.run(r);
}
