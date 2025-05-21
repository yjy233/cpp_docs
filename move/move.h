# include <iostream>

class MoveA {

private:
    int* data;
public:
    MoveA(int size) : data(new int[size]) {}
    MoveA(const MoveA& other) : data(new int[*other.data]) {}
    MoveA(MoveA&& other) noexcept : data(other.data) {}
    ~MoveA();
};