#include "application.h"
#include "FreeRTOS.h"
#include "task.h"
#include "heater_control.h"
#include "motor_control.h"
#include "gui_thread.h"

TaskHandle_t gui_thread_handle;
TaskHandle_t motor_control_thread_handle;
TaskHandle_t heater_thread_handle;

void app_main(void)
{
    xTaskCreate(&gui_thread_task, "gui_thread", 1024, NULL, 0, &gui_thread_handle);
    xTaskCreate(&motor_control_task, "gui_thread", 1024, NULL, 0, &motor_control_thread_handle);
    xTaskCreate(&heater_control_task, "gui_thread", 1024, NULL, 0, &heater_thread_handle);
}