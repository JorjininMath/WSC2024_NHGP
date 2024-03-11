function noise_camel = noise_function_camel(xdesign)

    x1 = xdesign(:,1);
    x2 = xdesign(:,2);
    noise_camel = (2 + cos(pi + (x1 + x2) ./ 2)).^2;