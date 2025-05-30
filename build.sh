bazel build -c dbg --spawn_strategy=standalone //syntax:all
dsymutil bazel-bin/syntax/concept -o bazel-bin/syntax/concept.dYSM

