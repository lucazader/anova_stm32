cmake_minimum_required(VERSION 3.9)

set(LOCAL_SOURCES
    src/pid_controller.cpp
    src/trace.c
)

set(LOCAL_INCLUDES
    inc/pid_controller.hpp
    inc/trace.h
)

add_library(modules ${LOCAL_SOURCES} ${LOCAL_INCLUDES})
target_include_directories(modules PUBLIC inc)
target_link_libraries(modules hal core)
