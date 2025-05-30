# include <iostream>


using namespace std;



template <typename T>
concept integral = std::is_integral_v<T>;


int main() {
    cout << "Hello, World!" << endl;
    int c = 20;

    int a = 0;

    a += 1;
    a += 2;
    a+=3;
    cout << a << endl;
    c += 30;
    cout << c << endl;

    cout<<"hit"<<endl;
    return 0;
}