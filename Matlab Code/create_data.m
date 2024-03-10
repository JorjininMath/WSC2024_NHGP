function func_budget_1 = create_data(func_budget)    
    % Define the number of columns in NHGP_sin2D
    num_columns = size(func_budget, 2);
    
    % Define the number of subsets
    num_subsets = 4;
    
    % Initialize the final matrix
    func_budget_1 = [];
    
    % Process each subset
    for i = 1:num_subsets
        % Extract subset data
        func_budget_subset = func_budget(2:51, i:4:num_columns);
        
        % Concatenate subset data
        func_budget_1 = [func_budget_1, func_budget_subset];
    end
end