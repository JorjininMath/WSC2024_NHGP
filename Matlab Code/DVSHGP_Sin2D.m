%% distributed VSHGP for sinc function

% Initialization
% nn = [5000];
nn = [200, 1000, 2000, 5000]; % number of samples
d = 2;
q = 5000; % number of test points
b = 10000;
micro_rep = 100;

train_path = 'C:\VT_STUDY\My_Research\WSC2024\WSC2024_NHGP_experiments\Training_data_matlab';
pred_path = 'C:\VT_STUDY\My_Research\WSC2024\WSC2024_NHGP_experiments\Predicting_data_matlab';

res = DVSHGP_function(@Sin2D, 'sin2D', train_path, pred_path, @noise_function_camel, nn, d, q, b, micro_rep);







