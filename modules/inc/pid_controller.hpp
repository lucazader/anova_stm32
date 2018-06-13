#pragma once
#include <chrono>

namespace pid {
class pid_controller
{
private:
    float _kp;
    float _ki;
    float _kd;
    float _integral{0.0F};
    float _last_error{0.0F};
    float _max_integral{0.0F};
    float _max_correction{0.0F};
    std::chrono::milliseconds _interval{1000};
    float accumulate_error(float error);
    float calculate_correction(float p, float i, float d);
    float limit_variable(float var, float min, float max);
    float get_derivitave(float error) {return (error - _last_error) / _interval.count();};


public:
    pid_controller(float kp, float ki, float kd,
                    float max_integral, float max_correction,
                    std::chrono::milliseconds interval); 
    
    ~pid_controller();
    float calculate(float set_value, float value);
    inline std::chrono::milliseconds get_interval() const { return _interval;};
};
} // namespace pid