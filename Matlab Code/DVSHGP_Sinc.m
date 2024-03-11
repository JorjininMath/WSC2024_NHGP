%% distributed VSHGP for sinc function
% clear all data
clear
clc
close all

% Initialization
% nn = [100, 200, 500, 1000, 2500];
nn = [100, 500, 1000, 2500]; % number of samples
d = 1;
q = 2500; % number of test points
b = 5000;
micro_rep = 100;

train_path = 'C:\VT_STUDY\My_Research\WSC2024\WSC2024_NHGP_experiments\Training_data_matlab';
pred_path = 'C:\VT_STUDY\My_Research\WSC2024\WSC2024_NHGP_experiments\Predicting_data_matlab';

res = DVSHGP_function(@Sinc, 'sinc', train_path, pred_path, @noise_function_sinc, nn, d, q, b, micro_rep);







