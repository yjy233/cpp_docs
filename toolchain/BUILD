load(":cc_toolchain_config.bzl", "cc_toolchain_config")

filegroup(name = "empty")

cc_toolchain_config(name = "macos_arm64_toolchain_config")

cc_toolchain(
    name = "macos_arm64_toolchain",
    toolchain_identifier = "macos_arm64-toolchain",  # toolchain 的唯一身份id
    toolchain_config = ":macos_arm64_toolchain_config",  # 指向工具链配置的标签
    all_files = ":empty",
    compiler_files = ":empty",
    dwp_files = ":empty",
    linker_files = ":empty",
    objcopy_files = ":empty",
    strip_files = ":empty",
    supports_param_files = 0,
)


# platforms https://bazel.build/extending/platforms
toolchain(
    name = "cc_toolchain_for_macos_arm64",
    toolchain = ":macos_arm64_toolchain",
    toolchain_type = "@bazel_tools//tools/cpp:toolchain_type",
    exec_compatible_with = [
        #"@platforms//cpu:x86_64",
        #"@platforms//os:linux",
        "@platforms//os:macos",
    ],
    target_compatible_with = [
        #"@platforms//cpu:x86_64",
        #"@platforms//os:linux",
        "@platforms//os:macos",
    ],
)


'''
cc_toolchain(
    name = "linux_x86_64_toolchain",
    toolchain_identifier = "linux_x86_64-toolchain",
    toolchain_config = ":linux_x86_64_toolchain_config",
    all_files = ":empty",
    compiler_files = ":empty",
    dwp_files = ":empty",
    linker_files = ":empty",
    objcopy_files = ":empty",
    strip_files = ":empty",
    supports_param_files = 0,
)

toolchain(
    name = "cc_toolchain_for_linux_x86_64",
    toolchain = ":linux_x86_64_toolchain",
    toolchain_type = "@bazel_tools//tools/cpp:toolchain_type",
    exec_compatible_with = [
        "@platforms//cpu:x86_64",
        "@platforms//os:linux",
    ],
    target_compatible_with = [
        "@platforms//cpu:x86_64",
        "@platforms//os:linux",
    ],
)'''

