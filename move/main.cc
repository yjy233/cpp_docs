# include "move.h"
#include <iostream>
#include <utility>



class MoveB {
public:
    MoveA&& A;
    MoveB(MoveA&& a) : A(std::move(a)) {
        std::cout << "MoveB::MoveB(MoveA&& a)" << std::endl;
    }
    MoveB(MoveA& a) : A(std::move(a)) {
        std::cout << "MoveB::MoveB(MoveA& a)" << std::endl;
    }
    ~MoveB() {
        std::cout << "MoveB::~MoveB()" << std::endl;
    }
};

void func(MoveB& b,MoveA&& a) {
    b.A = std::forward<MoveA>(a); // MoveA::MoveA(MoveA&& other)
}

int main(){
    
    MoveA a(10);
    
    MoveB b(std::move(a));
    func(b, std::move(a)); // MoveA::MoveA(MoveA&& other)

    //std::cout << "MoveA::~MoveA()" << std::endl;
}