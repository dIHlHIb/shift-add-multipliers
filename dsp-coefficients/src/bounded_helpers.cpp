// Complete target-width decision for two normalized odd targets and up to four extra gates.
// Enumerate helper births in forward order. For the last helper, invert the first not-yet-
// reached target gate and still check the helper's actual birth and both target outputs.
#include <algorithm>
#include <array>
#include <cstdint>
#include <iostream>
#include <set>
#include <stdexcept>
#include <unordered_map>
#include <unordered_set>
#include <vector>

using N = unsigned;
using List = std::vector<N>;

static bool has(const List& a, N x) { return std::find(a.begin(),a.end(),x)!=a.end(); }
static N odd(N n) { return n ? n>>__builtin_ctz(n) : 0; }
static bool oriented(N a,N b,N t) {
    N sum=a+b, diff=a>b?a-b:b-a;
    return (sum>t && odd(sum)==t) || (diff>t && odd(diff)==t);
}
static bool gate(N a,N b,N t) {
    return oriented(a,b,t) || oriented(a,t,b) || oriented(b,t,a);
}
static bool reachable(const List& live,N t) {
    for (std::size_t i=0;i<live.size();++i)
        for (std::size_t j=0;j<=i;++j)
            if (gate(live[i],live[j],t)) return true;
    return false;
}

class Search {
    N cap;
    List targets;
    std::array<std::unordered_set<std::uint64_t>,5> seen;
    std::unordered_map<std::uint64_t,List> cache;
    List certificate;
    std::uint64_t prefixes=0, last_attempts=0;

    List children(N a,N b) {
        N low=std::min(a,b), high=std::max(a,b);
        auto key=(std::uint64_t(low)<<16)|high;
        auto old=cache.find(key);
        if(old!=cache.end()) return old->second;
        List values;
        auto add=[&](N x) { if(x>1 && x<=cap) values.push_back(x); };
        add(odd(a+b));add(odd(high-low));
        for(int flip=0;flip<2;++flip){
            for(N x=2*a;x<=cap+b;x*=2) { add(x+b);add(x>b?x-b:b-x); }
            std::swap(a,b);
        }
        std::sort(values.begin(),values.end());
        values.erase(std::unique(values.begin(),values.end()),values.end());
        if(cache.size()<80000)cache.emplace(key,values);
        return values;
    }
    bool close(List& live) const {
        bool changed;
        do {
            changed=false;
            for(N t:targets)if(!has(live,t) && reachable(live,t)){
                live.push_back(t);changed=true;
            }
        }while(changed);
        return has(live,targets[0]) && has(live,targets[1]);
    }
    bool last(const List& live,List& helpers) {
        std::set<N> candidates;
        for(N t:targets)if(!has(live,t)){
            for(N z:live){
                auto adjacent=children(t,z);candidates.insert(adjacent.begin(),adjacent.end());
            }
            // Both parents can be the new helper. Then t is its odd multiple 2^j +/- 1.
            for(N power=2;power<=2*cap;power*=2)
                for(N factor:{power-1,power+1})
                    if(t%factor==0)candidates.insert(t/factor);
        }
        for(N h:candidates){
            if(has(live,h) || has(targets,h) || !reachable(live,h))continue;
            ++last_attempts;
            List possible=live;possible.push_back(h);
            if(close(possible)){certificate=helpers;certificate.push_back(h);return true;}
        }
        return false;
    }
    bool visit(List live,List& helpers,N left) {
        List sorted=helpers;std::sort(sorted.begin(),sorted.end());std::uint64_t key=0;
        for(N h:sorted)key=(key<<16)|h;
        if(!seen[helpers.size()].insert(key).second)return false;
        ++prefixes;
        if(close(live)){certificate=helpers;return true;}
        if(!left)return false;
        if(left==1)return last(live,helpers);
        std::set<N> next;
        for(std::size_t i=0;i<live.size();++i)for(std::size_t j=0;j<=i;++j){
            auto ns=children(live[i],live[j]);next.insert(ns.begin(),ns.end());
        }
        for(N h:next)if(!has(live,h) && !has(targets,h)){
            live.push_back(h);helpers.push_back(h);
            if(visit(live,helpers,left-1))return true;
            helpers.pop_back();live.pop_back();
        }
        return false;
    }
public:
    Search(N width,N a,N b):cap((1u<<width)-1),targets({a,b}){}
    void run(N helpers){
        List chosen;
        bool fit=visit({1},chosen,helpers);
        std::cout<<(fit?"POSSIBLE":"IMPOSSIBLE")<<" prefixes "<<prefixes<<" last "<<last_attempts<<" helpers";
        for(N x:certificate)std::cout<<" "<<x;
        std::cout<<"\n";
    }
};
int main(int argc,char**argv){
    if(argc!=5)return 2;
    N w=std::stoul(argv[1]),h=std::stoul(argv[2]),a=std::stoul(argv[3]),b=std::stoul(argv[4]);
    if(w<2||w>16||h>4||a<=1||b<=1||a==b||!(a%2)||!(b%2)||std::max(a,b)>=(1u<<w))return 2;
    Search(w,a,b).run(h);
}
