load("@rules_cc//cc:cc_binary.bzl", "cc_binary")
load("@rules_cc//cc:cc_library.bzl", "cc_library")

cc_binary(
    name = "base",
    srcs = ["base.cc"],
    includes = ["/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include"],
    copts = ["-lstdc++", "-g"],
)