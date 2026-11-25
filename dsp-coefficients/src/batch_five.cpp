// Enumerate at most three modular gates, then solve exactly for the final two.
#include <algorithm>
#include <array>
#include <cstdint>
#include <fstream>
#include <iostream>
#include <numeric>
#include <set>
#include <stdexcept>
#include <unordered_map>
#include <unordered_set>
#include <vector>
using W=uint32_t;
using Wide=uint64_t;
using V=std::vector<W>;
using Prefix=std::array<W,3>;
struct PrefixHash {
    size_t operator()(const Prefix& a) const {
        size_t h=1;
        for(W x:a) h=(h^x)*1099511628211ULL;
        return h;
    }
};
static bool has(const V& v,W x){return std::find(v.begin(),v.end(),x)!=v.end();}
static bool contains(const V& v,W x){return std::binary_search(v.begin(),v.end(),x);}
static void unique(V& v){std::sort(v.begin(),v.end());v.erase(std::unique(v.begin(),v.end()),v.end());}
struct Query {W a,b,raw_a,raw_b; V bridges; bool fits=false;};
class Search {
    int p;
    int budget;
    W mod;
    V canonical_table;
    std::unordered_map<Wide,V> pairs;
    std::unordered_map<W,V> repeats;
    std::unordered_map<W,std::vector<size_t>> incident;
    std::vector<Query> queries;
    std::array<std::unordered_set<Prefix,PrefixHash>,4> seen;
    W rotate(W x) const {return ((x<<1)&mod)|(x>>(p-1));}
    W rotmin(W x) const {
        W best=x;
        for(int i=0;i<p;++i,x=rotate(x))best=std::min({best,x,mod-x});
        return best;
    }
    W canonical(W x) const {return canonical_table.empty()?rotmin(x):canonical_table[x];}
    V successors(W a,W b) const {
        V out;out.reserve(2*p);
        for(int j=0;j<p;++j,b=rotate(b)) {
            W x=a+b, y=a+mod-b;
            out.push_back(canonical(x>=mod?x-mod:x));
            out.push_back(canonical(y>=mod?y-mod:y));
        }
        unique(out);return out;
    }
    const V& children(W a,W b) {
        auto key=(Wide(std::min(a,b))<<32)|std::max(a,b);
        auto it=pairs.find(key);
        if(it==pairs.end()) it=pairs.emplace(key,successors(a,b)).first;
        return it->second;
    }
    W invert(W a) const {
        int64_t x=a,y=mod,s=1,t=0;
        while(y){auto q=x/y, nr=x-q*y, nt=s-q*t;x=y;y=nr;s=t;t=nt;}
        if(x!=1) throw std::runtime_error("unsupported nonunit in repeated-parent condition");
        return W((s+mod)%mod);
    }
    const V& repeated_parents(W t) {
        auto it=repeats.find(t);if(it!=repeats.end())return it->second;
        V v;
        for(int j=0;j<p;++j)for(int sign:{-1,1}){
            W d=W((int64_t(W(1)<<j)+sign)%mod);
            if(d)v.push_back(canonical(W(Wide(t)*invert(d)%mod)));
        }
        unique(v);return repeats.emplace(t,std::move(v)).first->second;
    }
    void visit(V& g) {
        const auto depth=g.size()-1;
        Prefix k{};std::copy(g.begin()+1,g.end(),k.begin());std::sort(k.begin(),k.begin()+depth);
        if(!seen[depth].insert(k).second)return;
        V next;
        for(size_t i=0;i<g.size();++i)for(size_t j=0;j<=i;++j){
            auto& v=children(g[i],g[j]);next.insert(next.end(),v.begin(),v.end());
        }
        unique(next);
        if(budget<2){
            for(auto& q:queries)q.fits=(q.a==1&&q.b==1)||
                (budget==1&&((q.a==1&&contains(next,q.b))||(q.b==1&&contains(next,q.a))));
            return;
        }
        for(W t:g){
            auto pos=incident.find(t);if(pos==incident.end())continue;
            for(auto id:pos->second){
                auto& q=queries[id];if(q.fits)continue;
                W b=t==q.a?q.b:q.a;
                if(has(g,b)||contains(next,b)){q.fits=true;continue;}
                auto overlaps=[&](const V& v){return std::any_of(v.begin(),v.end(),[&](W y){return contains(next,y);});};
                if(overlaps(repeated_parents(b))){q.fits=true;continue;}
                for(W z:g)if(overlaps(children(b,z))){q.fits=true;break;}
            }
        }
        for(W t:next){
            auto pos=incident.find(t);if(pos==incident.end())continue;
            for(auto id:pos->second){
                auto& q=queries[id];if(q.fits)continue;
                W b=t==q.a?q.b:q.a;
                // Either independent final gates, or the penultimate target is a parent.
                if(contains(next,b)||has(g,b)||contains(q.bridges,t)||
                   std::any_of(g.begin(),g.end(),[&](W z){return contains(q.bridges,z);}))q.fits=true;
            }
        }
        if(int(depth)<budget-2)for(W x:next)if(x&&!has(g,x)){
            g.push_back(x);visit(g);g.pop_back();
        }
    }
public:
    Search(int period,int limit):p(period),budget(limit),mod((W(1)<<p)-1){
        if(budget<0||budget>5)throw std::runtime_error("budget outside [0,5]");
        if(p<3||p>31)throw std::runtime_error("period outside [3,31]");
        for(int j=2;j*j<=p;++j)if(p%j==0)throw std::runtime_error("odd prime period required");
        if(p<=23){
            canonical_table.resize(mod+1);
            for(W x=1;x<mod;++x)if(!canonical_table[x]){
                W y=x;
                for(int j=0;j<p;++j,y=rotate(y)) canonical_table[y]=canonical_table[mod-y]=x;
            }
        }
    }
    void add(W a,W b){
        const W raw_a=a,raw_b=b; a=canonical(a%mod);b=canonical(b%mod);
        if(!a)a=1;if(!b)b=1;if(a==b)a=1;
        auto id=queries.size();queries.push_back({a,b,raw_a,raw_b,children(a,b),false});
        incident[a].push_back(id);if(b!=a)incident[b].push_back(id);
    }
    void run(){
        V g={1};visit(g);
        for(const auto& q:queries)std::cout<<q.raw_a<<' '<<q.raw_b<<' '<<q.fits<<'\n';
        std::cerr<<"period "<<p<<" prefixes";for(auto &v:seen)std::cerr<<' '<<v.size();
        std::cerr<<" cache "<<pairs.size()<<" queries "<<queries.size()<<'\n';
    }
};
int main(int argc,char**argv){
    if(argc!=3&&argc!=4)return 1;
    Search s(std::stoi(argv[1]),argc==4?std::stoi(argv[3]):5);std::ifstream f(argv[2]);if(!f)return 2;
    W a,b;while(f>>a>>b)s.add(a,b);s.run();
}
