#include "pid_controller.hpp"
#include "heater_control.hpp"
#include <chrono>
#include <algorithm>

#ifdef __cplusplus
extern "C" {
#endif
#include "heater_control_task.h"
#include "FreeRTOS.h"
#include "task.h"
#include "trace.h"
#ifdef __cplusplus
}
#endif

void heater_control_task(void * args)
{
    // todo tune the PID values
    heater::heater_controller heat_element(85.0f);
    heat_element.set_temperature_target(53.0f);
    heat_element.set_heater_enabled(true);

    using namespace std::chrono_literals;
    pid::pid_controller heater_pid(1.0f, 0.0f, 0.0f, 30.0f, 10.0f, 200ms);
	while(1) {
		vTaskDelay(heater_pid.get_interval().count());
        heat_element.set_pwm(heater_pid.calculate(heat_element.get_set_temperature(),
                                    heat_element.get_temperature()));
	}
}

namespace heater {
float heater_controller::get_temperature(void)
{
    // todo get adc value
    return 50.0f;
}

void heater_controller::set_pwm(float correction)
{
    _pwm_value += correction;
}

void heater_controller::set_temperature_target(temperature_t temperature)
{
    _set_temperature = std::min(temperature, _max_temperature);
    TRACE_I("New set temperature: %i", (int)_set_temperature);
}
} // namespace heater



