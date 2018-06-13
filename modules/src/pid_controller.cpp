#include "../inc/pid_controller.hpp"
#include <algorithm>

namespace pid {

pid_controller::pid_controller(float kp, float ki, float kd,
                                float max_integral, float max_correction,
                                std::chrono::milliseconds interval)
{
    _kp = kp;
    _ki = ki;
    _kd = kd;
    _max_integral = max_integral;
    _max_correction = max_correction;
    _interval = interval;
}

float pid_controller::calculate(float set_value, float value)
{
    float error = set_value - value;

    float p_term = error * _kp;
    float i_term = accumulate_error(error) * _ki;
    float d_term = get_derivitave(error) * _kd;

    _last_error = error;

    return calculate_correction(p_term, i_term, d_term);
}

float pid_controller::accumulate_error(float error)
{
    _integral += error * _interval.count();
    return limit_variable(_integral, -_max_integral, _max_integral);
}

float pid_controller::calculate_correction(float p, float i, float d)
{
    float correction = p + i + d;
    return limit_variable(correction, -_max_correction, _max_correction);
}

float pid_controller::limit_variable(float var, float min, float max)
{
    var = std::max(var, min);
    return std::min(var, max);
}

}