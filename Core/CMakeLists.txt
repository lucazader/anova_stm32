cmake_minimum_required(VERSION 3.9)

set(CORE_DIR "${PROJECT_SOURCE_ROOT_DIR}/Core")
set(CORE_INCLUDE_DIRS ${CORE_DIR}/Inc)

set(CORE_SOURCES
    ${CORE_DIR}/Src/dma.c
    ${CORE_DIR}/Src/freertos.c
    ${CORE_DIR}/Src/gpio.c
    ${CORE_DIR}/Src/main.c
    ${CORE_DIR}/Src/spi.c
    ${CORE_DIR}/Src/stm32f1xx_hal_msp.c
    ${CORE_DIR}/Src/stm32f1xx_it.c
    ${CORE_DIR}/Src/system_stm32f1xx.c
    ${CORE_DIR}/Src/tim.c
    ${CORE_DIR}/Src/usart.c
    ${CORE_DIR}/Src/usb_device.c
    ${CORE_DIR}/Src/usbd_cdc_if.c
    ${CORE_DIR}/Src/usbd_conf.c
    ${CORE_DIR}/Src/usbd_desc.c
)

set(CORE_HEADERS
    ${CORE_DIR}/Inc/dma.h
    ${CORE_DIR}/Inc/freeRTOSConfig.h
    ${CORE_DIR}/Inc/gpio.h
    ${CORE_DIR}/Inc/main.h
    ${CORE_DIR}/Inc/spi.h
    ${CORE_DIR}/Inc/stm32f1xx_hal_conf.h
    ${CORE_DIR}/Inc/stm32f1xx_it.h
    ${CORE_DIR}/Inc/tim.h
    ${CORE_DIR}/Inc/usart.h
    ${CORE_DIR}/Inc/usb_device.h
    ${CORE_DIR}/Inc/usbd_cdc_if.h
    ${CORE_DIR}/Inc/usbd_conf.h
    ${CORE_DIR}/Inc/usbd_desc.h
)

add_library(core STATIC ${CORE_HEADERS} ${CORE_SOURCES})
target_include_directories(core PUBLIC ${CORE_INCLUDE_DIRS})
target_link_libraries(core usbd hal freertos)
