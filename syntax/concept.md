# concept

# 作用
主要用于c++ template的限制
typename T的限制


## requries 
可以单独使用，其实可以看作是一个返回值为bool的函数

唯一的问题不同的是，其实是变量是否能够正常的编译

比如：
```
cout<<requires (int a){
        a++;
        a--;
    }<<endl;
```
返回值是true


也可以嵌套使用，比如：
```
cout<<requires (int a, int b){
    a++;
    a--;

    requires intType<string>; // string 是否 intType
}<<endl;
```

## concept

concept 主要问题是定义一种有约束的模版。

例如 
```
// 常规定义
template <typename T>
concept intType = requires (T a){ 
    a++;
    a--;
};
```

