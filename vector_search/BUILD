load("@rules_cc//cc:cc_binary.bzl", "cc_binary")

cc_binary(
    name = "flatL2",
    srcs = ["flat.cc"],

    deps = [
        
    ],
    linkopts = [
        "-L/opt/homebrew/cellar/faiss/1.11.0/lib",
        "-lfaiss",
    ],
)