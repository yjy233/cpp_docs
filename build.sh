bazel build -c dbg --spawn_strategy=standalone //syntax:all --subcommands 
dsymutil bazel-bin/syntax/concept -o bazel-bin/syntax/concept.dYSM

bazel test --cxxopt=-std=c++17 //gtest:all

bazel build //main:hello-world --platforms=//:macos_arm64

bazel build //main:hello-world --platforms=//:android_x86_64

# 自己注册toolchain 
bazel build  --cpu=arm64 --compiler=gcc //main:hello-world