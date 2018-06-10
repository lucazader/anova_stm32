cmake_minimum_required(VERSION 3.9)

include(utils)

set(USBD_CDC_DIR "${PROJECT_SOURCE_ROOT_DIR}/Middlewares/ST/STM32_USB_Device_Library/")
check_if_dir_exists(${USBD_CDC_DIR})

set(USBD_INCLUDE_DIRS
    ${USBD_CDC_DIR}/Core/Inc
    ${USBD_CDC_DIR}/Class/CDC/Inc
)

set(USBD_SOURCES
    ${USBD_CDC_DIR}/Core/Src/usbd_core.c
    ${USBD_CDC_DIR}/Core/Src/usbd_ioreq.c
    ${USBD_CDC_DIR}/Core/Src/usbd_ctlreq.c
    ${USBD_CDC_DIR}/Class/CDC/Src/usbd_cdc.c
)

set(USBD_HEADERS
    ${USBD_CDC_DIR}/Core/Inc/usbd_core.h
    ${USBD_CDC_DIR}/Core/Inc/usbd_ctlreq.h
    ${USBD_CDC_DIR}/Core/Inc/usbd_def.h
    ${USBD_CDC_DIR}/Core/Inc/usbd_ioreq.h
    ${USBD_CDC_DIR}/Class/CDC/Inc/usbd_cdc.h
)

add_library(usbd STATIC ${USBD_HEADERS} ${USBD_SOURCES})
target_include_directories(usbd PUBLIC ${USBD_INCLUDE_DIRS})
target_link_libraries(usbd core)
