# include <iostream>

class MoveA {

private:
    int data;
public:
    MoveA(int size): data(size){
        std::cout << "MoveA::MoveA(int size)" << std::endl;
    }
    MoveA() {
        std::cout << "MoveA::MoveA()" << std::endl;
    }
    MoveA(const MoveA& other) {
        std::cout << "MoveA::MoveA(const MoveA& other)" << std::endl;
        this->data = other.data;
    };
    MoveA(const MoveA&& other) noexcept : data(other.data) {
        std::cout << "MoveA::MoveA(MoveA&& other)" << std::endl;
    }

    ~MoveA();

    void operator = (const MoveA& other) {
        std::cout << "MoveA::operator = (const MoveA& other)" << std::endl;
        this->data = other.data;
    }

    

    int GetData() {return data;}
    int& GetDataRef() {return data;}
    int&& GetDataRightRef() {return std::move(data);}
};