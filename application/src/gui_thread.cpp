#ifdef __cplusplus
extern "C" {
#endif
#include "gui_thread.h"
#include "FreeRTOS.h"
#include "task.h"
#ifdef __cplusplus
}
#endif


void gui_thread_task(void * args)
{
	while(1) {
		vTaskDelay(50);
	}
}
