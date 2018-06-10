cmake_minimum_required(VERSION 3.9)

include(utils)

set(FREERTOS_SOURCE_DIR "${PROJECT_SOURCE_ROOT_DIR}/Middlewares/Third_Party/FreeRTOS/Source")
check_if_dir_exists(${FREERTOS_SOURCE_DIR})


set(FREERTOS_SOURCES
    ${FREERTOS_SOURCE_DIR}/list.c
    ${FREERTOS_SOURCE_DIR}/queue.c
    ${FREERTOS_SOURCE_DIR}/croutine.c
    ${FREERTOS_SOURCE_DIR}/timers.c
    ${FREERTOS_SOURCE_DIR}/event_groups.c
    ${FREERTOS_SOURCE_DIR}/tasks.c
    ${FREERTOS_SOURCE_DIR}/CMSIS_RTOS/cmsis_os.c
    ${FREERTOS_SOURCE_DIR}/portable/GCC/ARM_CM3/port.c
    ${FREERTOS_SOURCE_DIR}/portable/MemMang/heap_4.c        
)

set(FREERTOS_HEADERS 
    ${FREERTOS_SOURCE_DIR}/include/queue.h
    ${FREERTOS_SOURCE_DIR}/include/task.h
    ${FREERTOS_SOURCE_DIR}/include/timers.h
    ${FREERTOS_SOURCE_DIR}/include/list.h
    ${FREERTOS_SOURCE_DIR}/include/FreeRTOS.h
    ${FREERTOS_SOURCE_DIR}/portable/GCC/ARM_CM3/portmacro.h
    ${FREERTOS_SOURCE_DIR}/CMSIS_RTOS/cmsis_os.h    
)

set(FREERTOS_INCLUDE_DIRS
    ${FREERTOS_SOURCE_DIR}/include
    ${FREERTOS_SOURCE_DIR}/CMSIS_RTOS
    ${FREERTOS_SOURCE_DIR}/portable/GCC/ARM_CM3
)

add_library(freertos ${FREERTOS_HEADERS} ${FREERTOS_SOURCES})
target_include_directories(freertos PUBLIC ${FREERTOS_INCLUDE_DIRS})
target_link_libraries(freertos core)