#include "motor_control.h"
#include "FreeRTOS.h"
#include "task.h"

void motor_control_task(void * args)
{
	while(1) {
		vTaskDelay(50);
	}
}
