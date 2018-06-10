cmake_minimum_required(VERSION 3.9)

include(utils)
include(freertos)
include(stm32_usb_cdc)
include(stm32f1xx_hal)
include(stm32f1xx_flags)

function(embedded_executible target)
    add_executable(${target} ${ARGN})
    set_target_properties(${target} PROPERTIES RUNTIME_OUTPUT_NAME ${target}.elf)
    generate_object(${target} .elf .hex ihex)
    generate_object(${target} .elf .bin binary)
    firmware_size(${target} .hex)

    # Common base libraries
    target_link_libraries(${target}
        "-Wl,--whole-archive"
        core
        "-Wl,--no-whole-archive"
        freertos
    )
endfunction()