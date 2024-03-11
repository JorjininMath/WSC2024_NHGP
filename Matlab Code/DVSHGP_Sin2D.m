%% distributed VSHGP for sinc function

% Initialization
nn = [500];
% nn = [500, 1000, 2500, 5000, 10000]; % number of samples
d = 2;
q = 5000; % number of test points
b = 50000;
micro_rep = 1;
n_induce = [100, 100];
n_experts = 5;

train_path = 'C:\VT_STUDY\My_Research\WSC2024\WSC2024_NHGP_experiments\Training_data_matlab';
pred_path = 'C:\VT_STUDY\My_Research\WSC2024\WSC2024_NHGP_experiments\Predicting_data_matlab';

res = DVSHGP_function(@Sin2D, 'sin2D', n_induce, n_experts, train_path, pred_path, @noise_function_sin2D, nn, d, q, b, micro_rep);







