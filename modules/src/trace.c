#include "trace.h"
#include "stm32f1xx_hal.h"
#include "usart.h"
#include <stdio.h>
#include <string.h>

extern UART_HandleTypeDef huart1;

#if !defined(NDEBUG)
int _write(int file, char *ptr, int len)
{
    HAL_UART_Transmit(&huart1, (uint8_t *)ptr, len, 0xFFFF);

    for (uint8_t i = 0; i < len; i ++) {
    	ITM_SendChar(*(ptr + i));
    }
    return len;
}
#endif // NDEBUG