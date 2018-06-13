#ifdef __cplusplus
extern "C" {
#endif
#include "motor_control.h"
#include "FreeRTOS.h"
#include "task.h"
#ifdef __cplusplus
}
#endif


void motor_control_task(void * args)
{
	while(1) {
		vTaskDelay(50);
	}
}
