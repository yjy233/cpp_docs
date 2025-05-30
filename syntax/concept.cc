# include <iostream>


using namespace std;


// 
template <typename T>
concept integral = std::is_integral_v<T>;

template <typename T>
    requires std::is_integral_v<T>
bool is_even(T value) {
    return value % 2 == 0;
};

template <typename T>
concept intTypte = requires (T a){ 
    a++;
    a--;

};

template <intTypte T>
T is_even2(T value) {
    return value;
    //return value % 2 == 0;
};


int main() {
    bool isOK = false;

    isOK = is_even(10);
    
    cout<<isOK<<endl;
    cout<<is_even2("2132")<<endl;
    return 0;
}