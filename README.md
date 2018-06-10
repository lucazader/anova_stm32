# Licencing
MIT License - see [LICENSE.md](LICENSE.md)

# About

This is a project to resurrect an Anova Precision Cooker (bluetooth model) that unfortunately fell into the water it was supposed to be heating.

On a post mortem teardown of the device it was found that all of the power electronics and sensors were still working fine, but the electronics board was found to be the faulty component.

This project will replace the built in electronics with some cheap readily avaliable electronics prototyping parts:

| Part | Description | Link |
| ---- | ----------- | ---- |
| STM32 "Blue Pill" | The cheap stm32f103c8 based board commonly found on aliexpress | [STM32duino](http://wiki.stm32duino.com/index.php?title=Blue_Pill) |
| ST-Link V2 | Developing code with a proper programmer and debugger is so much nicer and faster than using the arduino IDE, espcially with STM32 microcontrolelrs. A cheap clone of the ST-Link v2 programmer will be fine. An afordable, and more functional alternative would be to get a Nucleo development board from digikey. These contain the microcontroller on a much larger dev board andd also an ST-link v2.1. The v2.1 has the SWO pin connected and also has inbuilt uart functinality for prinf debugging. | [Digikey - Nucleo](https://www.digikey.com/product-detail/en/stmicroelectronics/NUCLEO-F103RB/497-14362-ND/4695527), [Aliexpress - BluePill](https://www.aliexpress.com/wholesale?catId=0&initiative_id=SB_20180610021459&SearchText=stm32) |
| SSD1306 OLED | SPI or I2C OLED display that is cheap and easy to use with many avaliable libraries | TBC |
| MAX31855 | SPI thermocouple interfacing chip. Takes all the hard work out of working with the thermocouple in the Precision Cooker | TBC |
| Non-functional Precision Cooker | Probably not advisable to specifically break your fully functional Precision cooker, but hey **it's not my money!** | [Anova's website](https://anovaculinary.com/anova-precision-cooker/)

# CI Status
Master:  ![Master build status](https://circleci.com/gh/lucazader/anova_stm32/tree/master.svg?style=shield&circle-token=:circle-token "Master build status")

# Requirements
| Program | Link |
| ------- | ---- |
| CMake >= 3.9 | https://cmake.org |
| Ninja | https://ninja-build.org |
| C++14 compliant compiler | [GNU Arm Embedded Toolchain](https://developer.arm.com/open-source/gnu-toolchain/gnu-rm/downloads) |

# Building
From your build directory run the following command:
```
cmake -DCMAKE_TOOLCHAIN_FILE=<path_to_source>/cmake/arm_gcc_toolchain.cmake -G <generator> -DCMAKE_BUILD_TYPE=<build_type> <path_to_source>
```
with:

| Token | Description | Possible values |
| ----- | ----------- | --------------- |
| `<path_to_source>` | The path to the `anova_stm32` source code. | |
| `<generator>` | The type of build system to generate. | `Ninja`, `"Unix Makefiles"` |
| `<build_type>` | The CMake build type. | `Debug`, `Release` |

Note: When debugging the code some IDE's (such as Atollic TrueStudio) work much better if the build directory is somewhere in the source directory. To ensure the source tree is kept clean it is recomended the create a `builds` directory in which the building will tkae place.
