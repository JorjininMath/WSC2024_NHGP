function data = load_data(folder_path, func_name, n, rep)
    % Construct the full file path based on the provided information
    if rep == 'pred'
        filename = sprintf('%s/pred_data_%s_n%d.mat', folder_path, func_name, n);
    else
        filename = sprintf('%s/train_data_%s_n%d_rep%d.mat', folder_path, func_name, n, rep);
    end
    
    % Load data from the constructed filename
    data = load(filename);
end
