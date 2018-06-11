project(anova_stm32)

cmake_minimum_required(VERSION 3.9)
enable_language(ASM C CXX)

set(PROJECT_SOURCE_ROOT_DIR ${CMAKE_CURRENT_SOURCE_DIR})
set(CMAKE_MODULE_PATH ${PROJECT_SOURCE_ROOT_DIR}/cmake)

set(CMAKE_LINKER_SCRIPT ${PROJECT_SOURCE_ROOT_DIR}/STM32F103C8Tx_FLASH.ld)

include(project)

add_subdirectory(Core)
add_subdirectory(Drivers)
add_subdirectory(application)

