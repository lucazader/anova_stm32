#include "gui_thread.h"
#include "FreeRTOS.h"
#include "task.h"

void gui_thread_task(void * args)
{
    vTaskDelay(50);
}