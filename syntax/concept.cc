#include <iostream>
#include <type_traits>


using namespace std;

// 常规定义
template <typename T>
concept intType = requires (T a){ 
    a++;
    a--;
};


//  
template <typename T>
concept integral = std::is_integral_v<T>;

template <typename T>
concept A = requires (T a,T b){
    a++;
    a--;
    {a+b} -> std::same_as<std::ostream&>;
    requires std::is_integral_v<T>;

};

template <typename intType>
intType is_even2(intType value) {
    return value;
    //return value % 2 == 0;
};


int main() {


    cout<<requires (int a){
        a++;
        a--;
    }<<endl;

    cout<<"------------------"<<endl;
    //isOK = is_even(10);
    
    cout<<requires (int a, int b){
        a++;
        a--;

        requires intType<string>; // string 是否 intType
    }<<endl;

    cout<<"------------------"<<endl;

    // constexpr
    
    
    bool isOK = false;
    cout<<isOK<<endl;

    cout<<is_even2<int>(1)<<endl;
    return 0;
}