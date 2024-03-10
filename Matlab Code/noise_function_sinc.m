function noise_sinc = noise_function_sinc(x)
    noise_sinc = 0.05 + 0.2*(1 + sin(2*x)) ./ (1 + exp(-0.2*x));