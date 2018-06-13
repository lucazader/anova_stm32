#pragma once

#include "stm32f1xx_hal.h"

#if !defined(NDEBUG)

    #if LOGGING_LEVEL > 0
        #define TRACE_E(...)                                                                               \
            printf("[%08lu  ERR] ", HAL_GetTick());                                                       \
            printf(__VA_ARGS__);                                                                           \
            printf("\n")
    #else
        #define TRACE_E(...)
    #endif // LOGGING_LEVEL > 0

    #if LOGGING_LEVEL > 1
        #define TRACE_W(...)                                                                               \
            printf("[%08lu WARN] ", HAL_GetTick());                                                        \
            printf(__VA_ARGS__);                                                                           \
            printf("\n")
    #else 
        #define TRACE_W(...)
    #endif // LOGGING_LEVEL > 1

    #if LOGGING_LEVEL > 2
        #define TRACE_I(...)                                                                               \
            printf("[%08lu INFO] ", HAL_GetTick());                                                        \
            printf(__VA_ARGS__);                                                                           \
            printf("\n")
    #else 
        #define TRACE_I(...)
    #endif // LOGGING_LEVEL > 2

    #if LOGGING_LEVEL > 3
        #define TRACE_D(...)                                                                               \
            printf("[%08lu DBUG] ", HAL_GetTick());                                                        \
            printf(__VA_ARGS__);                                                                           \
            printf("\n")
    #else 
        #define TRACE_D(...) 
    #endif // LOGGING_LEVEL > 3
    

#else // defined(NDEBUG)

    #define TRACE_E(...)
    #define TRACE_W(...)
    #define TRACE_I(...)
    #define TRACE_D(...)  

#endif //!defined(NDEBUG)