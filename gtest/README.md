
# 使用
先注销自己定义cc_toolchain 因为在使用ar 会用rcsD 的时候会报错
这是因为可能features没设置好

brew install googletest

# 然后以来就用MODULE.bazel

bazel_dep(name = "googletest", version = "1.17.0")就行

然后WORKSPACE 和 MODULE.bazel 其实作用是一样的，但是workspace在bazel9会被抛弃，直接用MODUEL.bazel就行
# TODO

学习
https://github.com/bazelbuild/bazel/blob/1620b6eb0f19ef60a87ede9eb7b69ce5d0ee78ce/tools/cpp/unix_cc_toolchain_config.bzl#L1210
