#package(default_visibility = ["//visibility:public"])

#filegroup(name = "macos_arm64_toolchain_config")
load("@bazel_tools//tools/build_defs/cc:action_names.bzl", "ACTION_NAMES")
# NEW
load(
    "@bazel_tools//tools/cpp:cc_toolchain_config_lib.bzl",
    "feature",    # NEW
    "flag_group", # NEW
    "flag_set",   # NEW
    "tool_path",
)

all_link_actions = [ # NEW
    ACTION_NAMES.cpp_link_executable,
    ACTION_NAMES.cpp_link_dynamic_library,
    ACTION_NAMES.cpp_link_nodeps_dynamic_library,
]

def _impl(ctx):
    tool_paths = [ # NEW
        tool_path(
            name = "gcc",  # Compiler is referenced by the name "gcc" for historic reasons.
            path = "/usr/bin/clang++",
        ),
        tool_path(
            name = "ld",
            path = "/usr/bin/ld",
        ),
        tool_path(
            name = "ar",
            path = "/usr/bin/ar",
        ),
        tool_path(
            name = "cpp",
            path = "/bin/false",
        ),
        tool_path(
            name = "gcov",
            path = "/bin/false",
        ),
        tool_path(
            name = "nm",
            path = "/bin/false",
        ),
        tool_path(
            name = "objdump",
            path = "/bin/false",
        ),
        tool_path(
            name = "strip",
            path = "/bin/false",
        ),
    ]

    return cc_common.create_cc_toolchain_config_info(
        ctx = ctx,
        cxx_builtin_include_directories = [ # NEW
            "/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include",
            "/Library/Developer/CommandLineTools/usr/lib/clang/17/include",
            "/usr/lib/llvm-16/lib/clang/16/include",
            "/usr/include",
        ],
        toolchain_identifier = "local",
        host_system_name = "local",
        target_system_name = "local",
        target_cpu = "k8",
        target_libc = "unknown",
        compiler = "gcc",
        abi_version = "unknown",
        abi_libc_version = "unknown",
        tool_paths = tool_paths,
    )

cc_toolchain_config = rule(
    implementation = _impl,
    attrs = {},
    provides = [CcToolchainConfigInfo],
)