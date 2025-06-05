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
    "with_feature_set",
    "variable_with_value",
)

# action name src code https://github.com/bazelbuild/bazel/blob/master/tools/build_defs/cc/action_names.bzl

all_link_actions = [ # NEW
    ACTION_NAMES.cpp_link_executable,
    ACTION_NAMES.cpp_link_dynamic_library,
    ACTION_NAMES.cpp_link_nodeps_dynamic_library,
    ACTION_NAMES.cpp_link_static_library,
]

def _impl(ctx):
    archiver_flags_feature = feature(
        name = "archiver_flags",
        enabled = True,
        flag_sets = [
            flag_set(
                actions = [ACTION_NAMES.cpp_link_static_library],
                flag_groups = [
                    flag_group(
                        flags = [
                            # 这里添加你需要的归档工具标志
                            "rcs"  # 详细输出模式
                        ],
                    ),
                    flag_group(
                        flags = ["%{output_execpath}"],
                        expand_if_available = "output_execpath",
                    ),
                ],
                with_features = [
                    with_feature_set(
                        not_features = ["libtool"],
                    ),
                ],
            ),
            flag_set(
                actions = [ACTION_NAMES.cpp_link_static_library],
                flag_groups = [
                    flag_group(flags = ["-static", "-s"]),
                    flag_group(
                        flags = ["-o", "%{output_execpath}"],
                        expand_if_available = "output_execpath",
                    ),
                ],
                with_features = [
                    with_feature_set(
                        features = ["libtool"],
                    ),
                ],
            ),
            flag_set(
                actions = [ACTION_NAMES.cpp_link_static_library],
                flag_groups = [
                    flag_group(
                        iterate_over = "libraries_to_link",
                        flag_groups = [
                            flag_group(
                                flags = ["%{libraries_to_link.name}"],
                                expand_if_equal = variable_with_value(
                                    name = "libraries_to_link.type",
                                    value = "object_file",
                                ),
                            ),
                            flag_group(
                                flags = ["%{libraries_to_link.object_files}"],
                                iterate_over = "libraries_to_link.object_files",
                                expand_if_equal = variable_with_value(
                                    name = "libraries_to_link.type",
                                    value = "object_file_group",
                                ),
                            ),
                        ],
                        expand_if_available = "libraries_to_link",
                    ),
                ],
            ),
            flag_set(
                actions = [ACTION_NAMES.cpp_link_static_library],
                flag_groups = ([
                    flag_group(
                        flags = ctx.attr.archive_flags,
                    ),
                ] if ctx.attr.archive_flags else []),
            ),
        ],
    )

    features = [
         feature(
             name = "default_linker_flags",
             enabled = True,
             flag_sets = [
                 flag_set(
                     actions = all_link_actions,
                     flag_groups = ([
                         flag_group(
                             flags = [
                                "-lstdc++",
                             ],
                         ),
                     ]),
                 ),
             ],
         ),
     ]

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
            "/opt/homebrew/include",
            "/opt/homebrew/include/googletest",
            "/opt/homebrew/include/googlemock",
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
        features = features + [archiver_flags_feature]
    )

cc_toolchain_config = rule(
    implementation = _impl,
    attrs = {
        "archive_flags": attr.string_list(),
    },
    provides = [CcToolchainConfigInfo],
)