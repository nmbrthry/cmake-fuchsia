set(CMAKE_SYSTEM_NAME Fuchsia)

set(TARGET x86_64-unknown-fuchsia)
set(CLANG_TARGET_TRIPLE x86_64-unknown-fuchsia)
set(CMAKE_C_COMPILER_TARGET ${CLANG_TARGET_TRIPLE})
set(CMAKE_CXX_COMPILER_TARGET ${CLANG_TARGET_TRIPLE})
set(CMAKE_ASM_COMPILER_TARGET ${CLANG_TARGET_TRIPLE})

set(FUCHSIA_SRC_ROOT "" CACHE PATH "Root checkout of fuchsia.git")
set(FUCHSIA_IDK_ROOT "" CACHE PATH "Root directory of the Fuchsia IDK")

# where is the target environment located
cmake_path(APPEND FUCHSIA_IDK_ROOT "arch/x64" OUTPUT_VARIABLE FUCHSIA_ROOT_PATH)
cmake_path(APPEND FUCHSIA_IDK_ROOT "arch/x64/sysroot" OUTPUT_VARIABLE FUCHSIA_SYSROOT_PATH)
set(CMAKE_FIND_ROOT_PATH ${FUCHSIA_ROOT_PATH} CACHE INTERNAL "")
set(CMAKE_SYSROOT ${FUCHSIA_SYSROOT_PATH} CACHE INTERNAL "")

# which compilers to use for C and C++
set(CMAKE_C_COMPILER
    "${FUCHSIA_SRC_ROOT}/prebuilt/third_party/clang/linux-x64/bin/clang")
set(CMAKE_CXX_COMPILER
    "${FUCHSIA_SRC_ROOT}/prebuilt/third_party/clang/linux-x64/bin/clang++")


# adjust the default behavior of the FIND_XXX() commands:
# search programs in the host environment
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)

# search headers and libraries in the target environment
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
