load("@rules_cc//cc:cc_binary.bzl", "cc_binary")
load("@rules_cc//cc:cc_library.bzl", "cc_library")

cc_binary(
    name = "hello-world",
    srcs = ["hello-world.cc"],
    includes = ["/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include"],
    copts = ["-lc++"],
)