# include "move.h"
#include <iostream>


MoveA::~MoveA() {
    std::cout << "MoveA::~MoveA()" << std::endl;
    delete[] data;
}

