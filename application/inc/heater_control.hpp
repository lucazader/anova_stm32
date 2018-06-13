#pragma once

namespace heater {
typedef float temperature_t;
class heater_controller {
private:
    temperature_t _set_temperature{25.0F};
    float _pwm_value{0.0f};
    bool _enabled{false};
    temperature_t _max_temperature{90.0f};

public:
    heater_controller();
    heater_controller(temperature_t max_temperature) { _max_temperature = max_temperature; };
    ~heater_controller();

    
    void set_heater_enabled(bool enabled = false) { _enabled = enabled;};
    float get_temperature();
    void set_temperature_target(temperature_t temperature);;
    float get_set_temperature(void) { return _set_temperature;};
    void set_pwm(float correction);

};
}