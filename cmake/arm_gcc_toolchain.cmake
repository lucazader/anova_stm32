cmake_minimum_required(VERSION 3.9)

set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_SYSTEM_PROCESSOR ARM)

if(MINGW OR CYGWIN OR WIN32)
    set(UTIL_SEARCH_CMD where)
elseif(UNIX OR APPLE)
    set(UTIL_SEARCH_CMD which)
endif()

set(TOOLCHAIN_PREFIX arm-none-eabi-)

execute_process(
  COMMAND ${UTIL_SEARCH_CMD} ${TOOLCHAIN_PREFIX}gcc
  OUTPUT_VARIABLE BINUTILS_PATH
  OUTPUT_STRIP_TRAILING_WHITESPACE
)

get_filename_component(ARM_TOOLCHAIN_DIR ${BINUTILS_PATH} DIRECTORY)
# Without that flag CMake is not able to pass test compilation check
set(CMAKE_EXE_LINKER_FLAGS_INIT "--specs=nosys.specs")

set(CMAKE_C_COMPILER ${TOOLCHAIN_PREFIX}gcc)
set(CMAKE_ASM_COMPILER ${CMAKE_C_COMPILER})
set(CMAKE_CXX_COMPILER ${TOOLCHAIN_PREFIX}g++)

set(CMAKE_OBJCOPY ${ARM_TOOLCHAIN_DIR}/${TOOLCHAIN_PREFIX}objcopy CACHE INTERNAL "objcopy tool")
set(CMAKE_SIZE_UTIL ${ARM_TOOLCHAIN_DIR}/${TOOLCHAIN_PREFIX}size CACHE INTERNAL "size tool")

set(CMAKE_FIND_ROOT_PATH ${BINUTILS_PATH})
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)

set(CMAKE_TRY_COMPILE_TARGET_TYPE STATIC_LIBRARY)

set(CMAKE_C_FLAGS_DEBUG          "-Og -g"   CACHE STRING "C compiler flags - debug")
set(CMAKE_CXX_FLAGS_DEBUG        "-Og -g"   CACHE STRING "C++ compiler flags - debug")
set(CMAKE_ASM_FLAGS_DEBUG        ""         CACHE STRING "ASM compiler flags - debug")
set(CMAKE_EXE_LINKER_FLAGS_DEBUG ""         CACHE STRING "Linker flags - debug")

set(CMAKE_C_FLAGS_RELEASE          "-Os -flto -fuse-linker-plugin" CACHE STRING "C compiler flags - release")
set(CMAKE_CXX_FLAGS_RELEASE        "-Os -flto -fuse-linker-plugin" CACHE STRING "C++ compiler flags - release")
set(CMAKE_ASM_FLAGS_RELEASE        ""                              CACHE STRING "ASM compiler flags - release")
set(CMAKE_EXE_LINKER_FLAGS_RELEASE "-flto -fuse-linker-plugin"     CACHE STRING "Linker flags - release")

set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY BOTH)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE BOTH)