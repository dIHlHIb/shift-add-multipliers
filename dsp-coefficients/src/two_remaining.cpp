// Exact modular helper search, using disjoint target cuts to filter the last two births.
#include <algorithm>
#include <cstdint>
#include <fstream>
#include <iostream>
#include <map>
#include <set>
#include <stdexcept>
#include <unordered_map>
#include <unordered_set>
#include <vector>
using W=uint32_t;using L=uint64_t;using V=std::vector<W>;using Map=std::unordered_map<W,W>;
static void unique(V& v){std::sort(v.begin(),v.end());v.erase(std::unique(v.begin(),v.end()),v.end());}
static bool has(const V& v,W x){return std::find(v.begin(),v.end(),x)!=v.end();}
static int pc(W x){return __builtin_popcount(x);}
static W get(const Map& m,W x){auto it=m.find(x);return it==m.end()?0:it->second;}
struct Solver{
    int p;W m;V reps,targets;Map raw,cutMember,unary;W goal,allCuts;std::vector<V>cuts,unaryLists;
    std::unordered_map<L,V> baseBirth;
    std::unordered_map<L,W> directCache;
    std::unordered_map<W,std::vector<std::pair<W,W>>> exceptionalCache;
    L prefixCount=0,penultCount=0,lastCandidates=0,lastReal=0;
    V answer;
    Solver(int period,const V& input):p(period),m((W(1)<<p)-1){
        if(p<3||p>31)throw std::runtime_error("invalid period");
        for(int j=2;j*j<=p;++j)if(p%j==0)throw std::runtime_error("prime exponent required");
        if(p<=23){reps.resize(m+1);for(W x=1;x<m;++x)if(!reps[x]){
            W y=x;for(int k=0;k<p;++k,y=rot(y))reps[y]=reps[m-y]=x;}}
        for(W t:input){W u=rep(t%m);if(u>1)targets.push_back(u);}unique(targets);
        if(targets.size()>=31)throw std::runtime_error("too many projected outputs");
        goal=(W(1)<<targets.size())-1;
        for(size_t i=0;i<targets.size();++i){W x=targets[i];for(int j=0;j<p;++j,x=rot(x))raw[x]=raw[m-x]=W(1)<<i;}
        makeCuts();
        V base=targets;base.push_back(1);
        for(W a:base)for(W b:base)if(a<=b)baseBirth.emplace(key(a,b),children(a,b));
    }
    L key(W a,W b)const{return (L(std::min(a,b))<<32)|std::max(a,b);}
    W rot(W x)const{return ((x<<1)&m)|(x>>(p-1));}
    W rep(W x)const{
        if(!reps.empty())return reps[x];
        W best=x;auto doubled=L(x)|(L(x)<<p);
        for(int i=0;i<p;++i){W y=W(doubled>>i)&m;best=std::min({best,y,m-y});}return best;
    }
    template<class Emit> void terms(W a,W b,Emit f)const{
        for(int i=0;i<p;++i,b=rot(b)){
            W x=a+b,y=a+m-b;f(x>=m?x-m:x);f(y>=m?y-m:y);}
    }
    V children(W a,W b)const{V v;v.reserve(2*p);terms(a,b,[&](W x){v.push_back(rep(x));});unique(v);return v;}
    W targetBits(W a,W b){
        auto id=key(a,b);auto it=directCache.find(id);if(it!=directCache.end())return it->second;
        W mask=0;terms(a,b,[&](W x){mask|=get(raw,x);});
        if(directCache.size()<300000)directCache.emplace(id,mask);return mask;
    }
    W invert(W a)const{
        int64_t x=a,y=m,s=1,t=0;while(y){auto q=x/y,rem=x-q*y,r=s-q*t;x=y;y=rem;s=t;t=r;}
        if(x!=1)throw std::runtime_error("nonunit");return W((s+m)%m);
    }
    void makeCuts(){
        V used;
        auto include=[&](V C){
            for(W t:C)if(has(used,t))return;
            V ext={1};W bit=0;for(size_t i=0;i<targets.size();++i){
                if(has(C,targets[i]))bit|=W(1)<<i;else ext.push_back(targets[i]);}
            for(W a:ext)for(W b:ext)if(a<=b && (targetBits(a,b)&bit))return;
            W id=W(1)<<cuts.size();cuts.push_back(C);V possible;
            for(W t:C){cutMember[t]=id;used.push_back(t);
                for(W a:ext){auto ns=children(t,a);possible.insert(possible.end(),ns.begin(),ns.end());}
                for(int j=0;j<p;++j)for(int sign:{-1,1}){
                    W z=W((int64_t(W(1)<<j)+sign)%m);if(z)possible.push_back(rep(W(L(t)*invert(z)%m)));}
            }
            unique(possible);unaryLists.push_back(possible);
            for(W v:possible)unary[v]|=id;
        };
        for(W t:targets)include({t});
        for(W t:targets)for(W u:targets)if(t<u)include({t,u});
        allCuts=(W(1)<<cuts.size())-1;
    }
    W asCuts(W targetMask)const{
        W mask=0;while(targetMask){int i=__builtin_ctz(targetMask);mask|=get(cutMember,targets[i]);targetMask&=targetMask-1;}return mask;
    }
    Map edges(W h)const{
        Map out;out.reserve(2*p*cutMember.size());
        for(const auto& entry:cutMember){
            const W mask=entry.second;
            terms(entry.first,h,[&](W x){out[rep(x)]|=mask;});
        }
        return out;
    }
    std::vector<std::pair<W,W>> exceptional(W h){
        auto it=exceptionalCache.find(h);if(it!=exceptionalCache.end())return it->second;
        // Values with two distinct cut bits can only come from two distinct target orbits.
        std::vector<std::pair<W,W>> hits;
        auto letters=edges(h);for(auto entry:letters)if(pc(entry.second)>=2)hits.push_back(entry);
        if(exceptionalCache.size()<250000)exceptionalCache.emplace(h,hits);
        return hits;
    }
    W close(V& g){
        W known=0;for(auto a:g)known|=get(raw,a);
        for(size_t i=0;i<g.size();++i)for(size_t j=0;j<=i;++j){
            W newBits=targetBits(g[i],g[j])&~known;known|=newBits;
            while(newBits){int n=__builtin_ctz(newBits);g.push_back(targets[n]);newBits&=newBits-1;}
            if(known==goal)return known;
        }return known;
    }
    V births(const V& g)const{
        V out;for(size_t i=0;i<g.size();++i)for(size_t j=0;j<=i;++j){
            auto it=baseBirth.find(key(g[i],g[j]));
            if(it!=baseBirth.end())out.insert(out.end(),it->second.begin(),it->second.end());
            else {auto v=children(g[i],g[j]);out.insert(out.end(),v.begin(),v.end());}
        }
        unique(out);out.erase(std::remove_if(out.begin(),out.end(),[&](W x){return !x||has(g,x);}),out.end());return out;
    }
    bool two(const V& live,const V& H){
        Map extra;W base=0;
        for(W h:H){base|=get(unary,h);for(auto [z,b]:edges(h))extra[z]|=b;}
        for(size_t i=0;i<H.size();++i)for(size_t j=0;j<i;++j)base|=asCuts(targetBits(H[i],H[j]));
        auto effective=[&](W x){return get(unary,x)|get(extra,x);};
        std::unordered_map<W,V> nearMasks;
        for(W u:births(live)){
            ++penultCount;W need=allCuts&~(base|effective(u));
            V ready,allowed;bool initialized=false;
            auto init=[&](){if(!initialized){ready=live;ready.push_back(u);W all=close(ready);
                if(all==goal){answer=H;answer.push_back(u);return true;}
                allowed=births(ready);initialized=true;}return false;};
            auto try_v=[&](W v){
                ++lastCandidates;if(init())return true;
                if(!std::binary_search(allowed.begin(),allowed.end(),v))return false;
                ++lastReal;V g=ready;g.push_back(v);if(close(g)!=goal)return false;
                answer=H;answer.insert(answer.end(),{u,v});return true;
            };
            // When already feasible, no final helper is necessary. All cuts must then be broken.
            if(!need){if(init())return true;for(W v:allowed)if(try_v(v))return true;continue;}
            if(pc(need)==1){
                unsigned c=__builtin_ctz(need);
                for(W v:unaryLists[c])if(try_v(v))return true;
                for(auto [v,b]:extra)if((need&b)&&try_v(v))return true;
                for(W t:cuts[c])for(W v:children(u,t))if(try_v(v))return true;
                continue;
            }
            auto it=nearMasks.find(need);
            if(it==nearMasks.end()){
                V good;
                for(auto [v,b]:unary)if(pc(need&~(b|get(extra,v)))<=1)good.push_back(v);
                for(auto [v,b]:extra)if(!get(unary,v)&&pc(need&~b)<=1)good.push_back(v);
                it=nearMasks.emplace(need,std::move(good)).first;
            }
            for(W v:it->second){
                W left=need&~effective(v);
                if((!left||(left&asCuts(targetBits(u,v))))&&try_v(v))return true;
            }
            for(auto [v,b]:exceptional(u))if(!(need&~(effective(v)|b))&&try_v(v))return true;
        }return false;
    }
    bool walk(V g,V H,int left,int shard,int shards){
        if(close(g)==goal){answer=H;return true;}
        if(left==2){++prefixCount;return two(g,H);}
        V next=births(g);
        for(size_t i=0;i<next.size();++i){
            if(H.empty()&&int(i%shards)!=shard)continue;
            auto gg=g,hh=H;gg.push_back(next[i]);hh.push_back(next[i]);if(walk(gg,hh,left-1,shard,shards))return true;
        }return false;
    }
};
int main(int argc,char**argv){
    if(argc<6)return 2;
    int p=std::stoi(argv[1]),r=std::stoi(argv[2]),shard=std::stoi(argv[3]),shards=std::stoi(argv[4]);
    if(r<2||r>5||shard<0||shard>=shards||(r==2&&shards!=1))return 3;
    V t;for(int i=5;i<argc;++i)t.push_back(std::stoul(argv[i]));
    Solver s(p,t);bool fit=s.walk({1},{},r,shard,shards);
    std::cout<<(fit?"POSSIBLE":"IMPOSSIBLE")<<" "<<p<<" "<<r<<" "<<shard<<"/"<<shards<<" cuts "<<s.cuts.size()
      <<" prefixes "<<s.prefixCount<<" penultimate "<<s.penultCount<<" last_candidates "<<s.lastCandidates<<" tested "<<s.lastReal<<" helpers";
    for(auto h:s.answer)std::cout<<" "<<h;
    std::cout<<"\n";
}
