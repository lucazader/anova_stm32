cmake_minimum_required(VERSION 3.9)

set(MCU "-mthumb -mcpu=cortex-m3 -mfloat-abi=soft")
set(C_DEFS "-DUSE_HAL_DRIVER -DSTM32F103xB")
set(CMAKE_LINKER_SCRIPT ${PROJECT_SOURCE_ROOT_DIR}/STM32F103C8Tx_FLASH.ld)

set(COMMON_FLAGS 
"${MCU} -ffunction-sections -fdata-sections -Wall -Wdouble-promotion \
-fsingle-precision-constant -fstack-usage")

set(CMAKE_C_FLAGS   "${COMMON_FLAGS} -std=gnu11 ${C_DEFS}"
                    CACHE INTERNAL "c compiler flags")

set(CMAKE_CXX_FLAGS "${COMMON_FLAGS} -fno-rtti -fno-exceptions ${C_DEFS}"
                    CACHE INTERNAL "cxx compiler flags")

set(CMAKE_ASM_FLAGS "${COMMON_FLAGS} -x assembler-with-cpp"
                    CACHE INTERNAL "asm compiler flags")

set(CMAKE_EXE_LINKER_FLAGS 
"${MCU} -specs=nano.specs -specs=nosys.specs -static \
-Wl,--gc-sections -lc -lm -lnosys -lstdc++ -lsupc++ \
-T ${CMAKE_LINKER_SCRIPT}"
CACHE INTERNAL "executable linker flags")

set(CMAKE_MODULE_LINKER_FLAGS 
"${MCU} -specs=nano.specs -specs=nosys.specs -static \
-Wl,-u,Reset_Handler "
CACHE INTERNAL "module linker flags")

set(CMAKE_SHARED_LINKER_FLAGS 
"${MCU} -specs=nano.specs -specs=nosys.specs -static \
-Wl,-u,Reset_Handler " 
CACHE INTERNAL "shared linker flags")