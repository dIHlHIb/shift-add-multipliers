// Construct six-gate integer circuits by solving the last two gates backwards.
// All reported paths are replayed over Z by a separate program. A search miss is inconclusive.
#include <algorithm>
#include <array>
#include <cstdint>
#include <fstream>
#include <iostream>
#include <set>
#include <string>
#include <unordered_map>
#include <unordered_set>
#include <vector>
using W=uint32_t; using V=std::vector<W>;
constexpr W cap=65535;
W odd(W n){return n?n>>__builtin_ctz(n):0;}
void include(V& s,W x){if(x>1&&x<=cap)s.push_back(x);}
bool has(const V& s,W x){return std::find(s.begin(),s.end(),x)!=s.end();}
struct Solver{
    std::unordered_map<uint64_t,V> cache;
    std::array<std::unordered_set<uint64_t>,4> seen;
    struct Case{W a,b;bool found=false;std::set<V> emitted;};
    std::vector<Case> cases;
    std::array<std::vector<unsigned>,cap+1> incident;
    std::array<W,cap+1> marks{},extended{};
    W epoch=0,extended_epoch=0;
    uint64_t tests=0;size_t remaining=0;
    std::ofstream out;
    size_t variants;
    Solver(const char* path,size_t limit):out(path),variants(limit){}
    const V& children(W a,W b){
        uint64_t k=(uint64_t(std::min(a,b))<<16)|std::max(a,b);auto i=cache.find(k);
        if(i!=cache.end())return i->second;
        V s;include(s,odd(a+b));include(s,odd(a>b?a-b:b-a));
        for(int flip:{0,1}){
            (void)flip;
            for(W x=2*a;x<=cap+b;x*=2){include(s,x+b);include(s,x>b?x-b:b-x);}
            std::swap(a,b);
        }
        std::sort(s.begin(),s.end());s.erase(std::unique(s.begin(),s.end()),s.end());
        return cache.emplace(k,std::move(s)).first->second;
    }
    void add(W a,W b){unsigned i=cases.size();cases.push_back({a,b,false,{}});incident[a].push_back(i);incident[b].push_back(i);++remaining;}
    void save(unsigned i,V path){
        if(cases[i].found)return;
        auto key=path;std::sort(key.begin(),key.end());
        if(!cases[i].emitted.insert(key).second)return;
        if(cases[i].emitted.size()>=variants){cases[i].found=true;--remaining;}
        out<<cases[i].a<<' '<<cases[i].b;
        for(size_t j=1;j<path.size();++j)out<<' '<<path[j];
        out<<'\n';
    }
    void finish(unsigned i,W a,W b,const V& g,W tick){
        if(cases[i].found)return;
        V h=g;if(!has(h,a))h.push_back(a);
        if(has(h,b)){save(i,h);return;}
        const W more=++extended_epoch;
        for(auto x:h)for(auto y:children(a,x))extended[y]=more;
        auto possible=[&](W y){return marks[y]==tick||extended[y]==more;};
        if(possible(b)){h.push_back(b);save(i,h);return;}
        if(h.size()+1>6)return; // number of gates after appending penultimate and last is h.size()+1
        ++tests;
        auto emit=[&](W y){if(!possible(y)||has(h,y)||y==b)return false;
            auto v=h;v.push_back(y);v.push_back(b);save(i,v);return true;};
        for(W x:h)for(W y:children(b,x))if(emit(y))return;
        for(W p=2;p<=2*cap;p*=2)for(W n:{p-1,p+1})if(b%n==0 && emit(b/n))return;
    }
    bool deep=false;
    void helper_before_both(unsigned i,W a,W b,const V& g,W tick){
        if(cases[i].found||has(g,a)||has(g,b)||marks[a]==tick)return;
        // a must use the next helper. b may use a and/or the helper, including twice.
        auto related=[&](W u,W v,W t){
            const auto& list=children(u,v);return std::binary_search(list.begin(),list.end(),t);
        };
        bool b_independent=marks[b]==tick||related(a,a,b);
        for(W z:g)if(related(a,z,b))b_independent=true;
        auto try_helper=[&](W h){
            if(marks[h]!=tick||h==a||h==b||has(g,h))return;
            bool ok=b_independent||related(h,a,b)||related(h,h,b);
            if(!ok)for(W z:g)if(related(h,z,b)){ok=true;break;}
            if(ok){auto path=g;path.insert(path.end(),{h,a,b});save(i,path);}
        };
        for(W z:g)for(W h:children(a,z))try_helper(h);
        for(W p=2;p<=2*cap;p*=2)for(W n:{p-1,p+1})if(a%n==0)try_helper(a/n);
    }
    void visit(V& g){
        const size_t depth=g.size()-1;
        V sorted(g.begin()+1,g.end());std::sort(sorted.begin(),sorted.end());
        uint64_t key=0;for(auto x:sorted)key=(key<<16)|x;
        if(!seen[depth].insert(key).second)return;
        W tick=++epoch;V next;
        for(size_t i=0;i<g.size();++i)for(size_t j=0;j<=i;++j)for(auto y:children(g[i],g[j]))if(marks[y]!=tick){
            marks[y]=tick;if(!has(g,y))next.push_back(y);
        }
        for(W a:g)for(auto i:incident[a])finish(i,a,cases[i].a+cases[i].b-a,g,tick);
        for(W a:next)for(auto i:incident[a])finish(i,a,cases[i].a+cases[i].b-a,g,tick);
        if(deep)for(unsigned i=0;i<cases.size();++i)if(!cases[i].found){
            auto a=cases[i].a,b=cases[i].b;
            helper_before_both(i,a,b,g,tick);helper_before_both(i,b,a,g,tick);
        }
        if(depth<3){
            std::sort(next.begin(),next.end());
            for(W y:next){if(!remaining)return;g.push_back(y);visit(g);g.pop_back();}
        }
    }
    void run(){V g{1};visit(g);for(auto& d:seen)std::cerr<<d.size()<<' ';
        std::cerr<<"queries "<<tests<<" found "<<cases.size()-remaining<<" remaining "<<remaining<<'\n';}
};
int main(int argc,char**argv){if(argc<3||argc>5)return 2;auto s=new Solver(argv[2],argc>=4?std::stoul(argv[3]):1);s->deep=argc==5&&std::string(argv[4])=="deep";std::ifstream f(argv[1]);if(!f)return 3;
    W a,b;while(f>>a>>b)s->add(a,b);s->run();delete s;}
