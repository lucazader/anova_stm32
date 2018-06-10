#include "heater_control.h"
#include "FreeRTOS.h"
#include "task.h"

void heater_control_task(void * args)
{
	while(1) {
		vTaskDelay(50);
	}
}
