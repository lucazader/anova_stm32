cmake_minimum_required(VERSION 3.9)

set(C_DEFS "-DUSE_HAL_DRIVER -DSTM32F103xB")

set(MCU "-mthumb -mcpu=cortex-m3 -mfloat-abi=soft")
set(COMMON_FLAGS
"-ffunction-sections -fdata-sections -Wall -Wdouble-promotion \
-fsingle-precision-constant -fstack-usage")

set(MCU_LINKER_FLAGS 
"${MCU} -specs=nano.specs -specs=nosys.specs -static \
-Wl,--gc-sections -lc -lm -lnosys -lstdc++ -lsupc++")

set(CMAKE_C_FLAGS_DEBUG          "-Og -g -gdwarf-4" CACHE STRING "C compiler flags - debug")
set(CMAKE_CXX_FLAGS_DEBUG        "-Og -g -gdwarf-4" CACHE STRING "C++ compiler flags - debug")
set(CMAKE_ASM_FLAGS_DEBUG        "-Og -g -gdwarf-4" CACHE STRING "ASM compiler flags - debug")
set(CMAKE_EXE_LINKER_FLAGS_DEBUG ""                 CACHE STRING "Linker flags - debug")

set(CMAKE_C_FLAGS_RELEASE          "-Os -flto -fuse-linker-plugin" CACHE STRING "C compiler flags - release")
set(CMAKE_CXX_FLAGS_RELEASE        "-Os -flto -fuse-linker-plugin" CACHE STRING "C++ compiler flags - release")
set(CMAKE_ASM_FLAGS_RELEASE        ""                              CACHE STRING "ASM compiler flags - release")
set(CMAKE_EXE_LINKER_FLAGS_RELEASE "-flto -fuse-linker-plugin"     CACHE STRING "Linker flags - release")

include("${CMAKE_CURRENT_LIST_DIR}/arm_gcc_toolchain.cmake")
