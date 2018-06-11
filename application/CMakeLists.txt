cmake_minimum_required(VERSION 3.9)

set(LOCAL_SOURCES
    src/application.c
    src/gui_thread.c
    src/heater_control.c
    src/motor_control.c
)

set(LOCAL_INCLUDES
    inc/application.h
    inc/gui_thread.h
    inc/heater_control.h
    inc/motor_control.h
)

embedded_executible(anova_stm32 ${LOCAL_SOURCES})
target_include_directories(anova_stm32 PUBLIC inc)
set_target_properties(anova_stm32 PROPERTIES LINK_FLAGS "-T ${CMAKE_LINKER_SCRIPT}")
target_link_libraries(anova_stm32 core)
