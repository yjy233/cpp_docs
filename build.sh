bazel build -c dbg --spawn_strategy=standalone //syntax:all
dsymutil bazel-bin/syntax/concept -o bazel-bin/syntax/concept.dYSM

bazel test --cxxopt=-std=c++17 //gtest:all

bazel build //main:hello-world --platforms=//:macos_arm64
