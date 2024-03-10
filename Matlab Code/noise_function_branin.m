function noise_branin = noise_function_branin(xdesign)

    x1 = xdesign(:,1);
    x2 = xdesign(:,2);
    % noise = (2 + cos(pi + (x1 + x2) ./ 2)).^2;
    noise_branin = 0.5 .* (3.*(2 + 2.*sin(pi.*x1) .* cos(3.*pi.*x2)));