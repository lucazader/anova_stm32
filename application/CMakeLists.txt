cmake_minimum_required(VERSION 3.9)

set(LOCAL_SOURCES
    src/application.c
    src/gui_thread.cpp
    src/heater_control.cpp
    src/motor_control.cpp
)

set(LOCAL_INCLUDES
    inc/application.h
    inc/gui_thread.h
    inc/heater_control_task.h
    inc/heater_control.hpp
    inc/motor_control.h
)

embedded_executible(anova_stm32 ${LOCAL_SOURCES})
target_include_directories(anova_stm32 PUBLIC inc)
target_link_libraries(anova_stm32 core modules)
