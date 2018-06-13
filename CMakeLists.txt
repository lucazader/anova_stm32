project(anova_stm32)

cmake_minimum_required(VERSION 3.9)
enable_language(ASM C CXX)

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

set(PROJECT_SOURCE_ROOT_DIR ${CMAKE_CURRENT_SOURCE_DIR})
set(CMAKE_MODULE_PATH ${PROJECT_SOURCE_ROOT_DIR}/cmake)

set(PROJECT_LINKER_SCRIPT ${PROJECT_SOURCE_ROOT_DIR}/STM32F103C8Tx_FLASH.ld CACHE STRING "Linker Script")
set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -T ${PROJECT_LINKER_SCRIPT}")
add_definitions(-DUSE_HAL_DRIVER -DSTM32F103xB)
if(CMAKE_BUILD_TYPE STREQUAL "Debug")
    add_definitions(-DLOGGING_LEVEL=4)
endif()

include(project)

add_subdirectory(Core)
add_subdirectory(modules)
add_subdirectory(Drivers)
add_subdirectory(application)

