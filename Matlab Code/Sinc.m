function sinc_result = Sinc(x)
    x = 20 * x - 10;

    sinc_result = zeros(size(x)); % Preallocate array for efficiency
    
    for i = 1:numel(x)
        if x(i) ~= 0
            sinc_result(i) = sin(pi * x(i)) / (pi * x(i));
        else
            sinc_result(i) = 1;
        end
    end

%     if(x ~= 0)
%         sinc = sin(pi*x) ./ (pi*x);
%     else
%         sinc = 0;
%     end
