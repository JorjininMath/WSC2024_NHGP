function Rp = compute_Rp(choice, var_noise, n, b)
    switch choice
        case 1
            Rp = ceil(b / n) * ones(n, 1); % equal
        case 2
            Rp = ceil(var_noise / sum(var_noise) * b); % unequal_1
        case 3
            Rp = ceil(sqrt(var_noise) / sum(sqrt(var_noise)) * b); % unequal_2
        otherwise
            error('Invalid choice')
    end
    % Check if Rp contains 1 and increment those elements by 1
    Rp(Rp == 1) = Rp(Rp == 1) + 1;
end
