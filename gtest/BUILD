load("@rules_cc//cc:cc_binary.bzl", "cc_binary")
load("@rules_cc//cc:cc_library.bzl", "cc_library")
load("@rules_cc//cc:cc_test.bzl", "cc_test")


cc_test(
    name = "hello_test",
    size = "small",
    srcs = ["hello_test.cc"],
    deps = [
        "@googletest//:gtest_main",
        "@googletest//:gtest",
    ],
)

'''
 copts = [
        "-std=c++17",
        "-L/opt/homebrew/Cellar/googletest/1.17.0/lib",
        "-lgtest",
        "-I/opt/homebrew/include",
    ],
    linkopts = [
        "-L/opt/homebrew/Cellar/googletest/1.17.0/lib",
        "-lgtest",
    ],
'''