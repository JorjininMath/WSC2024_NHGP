%% distributed VSHGP function
function res_dvshgp = DVSHGP_function(func_name, funcname, n_induce, n_experts, train_path, pred_path, noise_func, nn, d, q, b, micro_rep)
% func_name: Matlab fuctions used in experiments 
% funcname: string of names of functions used in experiments
% n_induce: number of inducing points for f and g of each expert respectively
% n_expterts: number of experts

%     rng(150);
%     x = lhsdesign(q, d);
    test_data = load_data(pred_path, funcname, q, 'pred');
    x = test_data.data;
    y_x = func_name(x);

    % different allocation methods
    Choice = [1, 2, 3];

    % --------------------------------------
    % -----------Distributed VSHGP model----
    % --------------------------------------

    % Initialize cell array to store results
    results = {};

    for m = 1:length(nn)
        n = nn(m);
        % -----Configurations-------------------
        options.Xnorm = 'N'; options.Ynorm = 'N';
        options.m = n_induce;
        options.M = n_experts;
        % options.m = [10; 10]; 
        % options.M = 5; 
        if n < options.m(1) || n < options.m(2); warning('The inducing size exceeds the expert training size.'); end
        options.numIter = -100; % number of opt iterations, the length of options.numIter is consistent to that of options.flag
                                 % negative: number of function evaluations; positive: number of line searches
        options.flag = 1; % if length(options.flag), we perform a one-stage inference; otherwise, a multi-stage inference
                            % flag = 1, paras=[variational paras; kernel paras; inducing paras]
                            % flag = 2, paras=[variational paras; kernel paras]
                            % flag = 3, paras=[variational paras; g kernel paras]
                            % flag = 4, paras=[variational paras]
        options.PseudoType = 'kmeans'; % type of initial inducing points including 'random', 'kmeans'
        options.InitialKernelParas = 'User'; % initilize kernel paras by standard GP or mannually, 'GP', 'User'
        options.partitionCriterion = 'pureKmeans';
        options.criterion = 'RBCM'; % aggregation
        for k = 1:length(Choice)
            choice = Choice(k);
            % train the model with multiple times
            fprintf('Running distributed VSHGP with n = %d, choice = %d, func_name = %s ...\n', n, choice, func2str(func_name))
            RMSE = zeros(micro_rep, 1);
            for i = 1:micro_rep
%                 % generate X each time
%                 rng(100*i + 9);
%                 X = lhsdesign(n, d);
                train_data = load_data(train_path, funcname, n, i-1);
                X = train_data.data;
                sigma_X = noise_func(X);
                var_X = sigma_X .^ 2;
                Rp = compute_Rp(choice, var_X, n, b);
        
                % Initialize Y_avg
                % Y_avg = zeros(n, 1);
                   
                h = 1;
                Y0 = zeros(b, 1);
                X0 = zeros(b, d);
                % Loop over each point
                for j = 1:n
                    % Initialize Y
                    % Y = zeros(Rp(j), 1);
            
                    % Loop over each replicate
                    for l = 1:Rp(j)
                        X0(h, :) = X(j, :); 
                        % Evaluate function with noise
                        Y0(h) = func_name(X(j, :)) + sigma_X(j) * randn(1, 1);
                        h = h + 1;
                    end
                    
                    % Compute average
                    % Y_avg(j) = mean(Y);
                end
        
                [experts,vshgp_model, t_train] = DistributedVSHGP_fast_train(X0, Y0, options); % use average data
            
                % prediction in test data
                [mustar, varstar, mu_fstar, var_fstar, mu_gstar, var_gstar, t_predict] = DistributedVSHGP_fast_predict(x, vshgp_model, experts, options);
            
                RMSE(i) = sqrt( mean((y_x - mu_fstar).^2) );
            end

            % Add results to cell array
            results{end+1} = struct('func', func2str(func_name), 'x', x, 'predict', mu_fstar, 'n', n, 'choice', choice, 'Rp', Rp, 'RMSE', RMSE);
        end
    end

    res_dvshgp = results;
end





