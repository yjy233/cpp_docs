load("@rules_cc//cc:cc_binary.bzl", "cc_binary")
load("@rules_cc//cc:cc_library.bzl", "cc_library")


cc_library(
    name = "move",
    hdrs = [
        "move.h"
    ],
    srcs = ["move.cc"]
)

cc_binary(
    name = "main",
    deps = [
        ":move"
    ],
    srcs = ["main.cc"]
)