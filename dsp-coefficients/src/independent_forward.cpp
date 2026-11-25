// Independent unpruned finite verification. Enumerate both helper births forward.
// For reachability, test every parent pair directly modulo 2^p-1. Nothing here
// uses inverse edges, prime-field division, or a first-use filter.
#include <algorithm>
#include <cstdint>
#include <iostream>
#include <set>
#include <stdexcept>
#include <string>
#include <unordered_map>
#include <vector>
using Word = std::uint64_t;
using Labels = std::vector<Word>;

class Replay {
    int period;
    Word modulus, goal;
    Labels targets;
    std::unordered_map<Word, Word> target_masks, pair_cache;
    static Word bit(std::size_t i) { return Word(1) << i; }
    Word twice(Word a) const { return ((a << 1) & modulus) | (a >> (period-1)); }
    Word canonical(Word a) const {
        Word value = a;
        for (int i=0; i<period; ++i, a=twice(a))
            value = std::min({value, a, modulus-a});
        return value;
    }
    Word direct_outputs(Word a, Word b) {
        if (a>b) std::swap(a,b);
        Word key=(a<<32)|b;
        auto old=pair_cache.find(key);
        if (old!=pair_cache.end()) return old->second;
        Word hits=0;
        for (int i=0; i<period; ++i,b=twice(b)) {
            for (Word raw : {(a+b)%modulus,(a+modulus-b)%modulus}) {
                auto found=target_masks.find(raw);
                if (found!=target_masks.end()) hits |= found->second;
            }
        }
        if (pair_cache.size()<500000) pair_cache.emplace(key,hits);
        return hits;
    }
    Word close(Labels &pool) {
        Word have=0;
        for (Word x : pool) {
            auto found=target_masks.find(x);
            if (found!=target_masks.end()) have |= found->second;
        }
        for (std::size_t j=0; j<pool.size(); ++j) {
            for (std::size_t i=0; i<=j; ++i) {
                Word fresh=direct_outputs(pool[i],pool[j]) & ~have;
                have |= fresh;
                while (fresh) {
                    unsigned n=__builtin_ctzll(fresh);
                    pool.push_back(targets[n]);
                    fresh &= fresh-1;
                }
            }
            if (have==goal) break;
        }
        return have;
    }
    std::set<Word> births(const Labels &pool) const {
        std::set<Word> extra;
        for (std::size_t i=0;i<pool.size();++i)
            for (std::size_t j=i;j<pool.size();++j) {
                Word a=pool[i], b=pool[j];
                for (int k=0;k<period;++k,b=twice(b)) {
                    extra.insert(canonical((a+b)%modulus));
                    extra.insert(canonical((a+modulus-b)%modulus));
                }
            }
        for (Word x:pool) extra.erase(x);
        return extra;
    }
public:
    Word first=0,second=0;
    Replay(int p, const Labels &values):period(p) {
        if (p<2 || p>31) throw std::invalid_argument("period must be in [2,31]");
        modulus=bit(p)-1;
        std::set<Word> unique;
        for (Word x : values) unique.insert(canonical(x%modulus));
        unique.erase(0); unique.erase(1);
        targets.assign(unique.begin(),unique.end());
        if (targets.size()>63) throw std::invalid_argument("at most 63 target classes");
        goal=bit(targets.size())-1;
        for (std::size_t i=0;i<targets.size();++i) {
            Word x=targets[i];
            for (int j=0;j<p;++j,x=twice(x)) {
                target_masks[x]=bit(i);
                target_masks[modulus-x]=bit(i);
            }
        }
    }
    Word third=0;
    bool feasible(int budget) {
        Labels start={0,1};
        if (close(start)==goal) return true;
        if (budget==0) return false;
        for (Word u:births(start)) {
            ++first;
            Labels one=start;
            one.push_back(u);
            if (close(one)==goal) return true;
            if (budget==1) continue;
            for (Word v:births(one)) {
                ++second;
                Labels two=one;
                two.push_back(v);
                if (close(two)==goal) return true;
                if (budget==3) {
                    for (Word z:births(two)) {
                        ++third;
                        Labels three=two;
                        three.push_back(z);
                        if (close(three)==goal) return true;
                    }
                }
            }
        }
        return false;
    }
};

int main(int argc,char**argv) {
    bool three=argc>1 && std::string(argv[1])=="--three";
    bool custom=argc>3 && std::string(argv[1])=="--budget";
    int budget=custom?std::stoi(argv[2]):(three?3:2);
    if(budget<0||budget>3)return 3;
    int start=custom?3:(three?2:1);
    if (argc<=start) return 2;
    Labels values;
    for (int i=start+1;i<argc;++i) values.push_back(std::stoull(argv[i]));
    Replay game(std::stoi(argv[start]),values);
    std::cout << (game.feasible(budget)?"POSSIBLE":"IMPOSSIBLE") << " "
              << game.first << " " << game.second;
    if (budget==3) std::cout << " " << game.third;
    std::cout << "\n";
}
