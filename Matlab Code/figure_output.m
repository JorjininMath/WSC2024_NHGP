%% file name
folder_path = 'C:\VT_STUDY\My_Research\WSC2024\WSC2024_NHGP_experiments\Output\Final result';
% filename = 'NHGP_result_031024.xlsx';
filename = 'NHGP_test.xlsx';
full_filename = fullfile(folder_path, filename);

%% load data
NHGP_sin2D = xlsread(full_filename, 3);
% NHGP_sin2D_1 = create_data(NHGP_sin2D);
% NHGP_sin2D_n1 = NHGP_sin2D(2:51, 1:5:12);
% NHGP_sin2D_n2 = NHGP_sin2D(2:51, 2:4:12);
% NHGP_sin2D_n3 = NHGP_sin2D(2:51, 3:4:12);
% NHGP_sin2D_n4 = NHGP_sin2D(2:51, 4:4:12);
% NHGP_sin2D_1 = [NHGP_sin2D_n1, NHGP_sin2D_n2, NHGP_sin2D_n3, NHGP_sin2D_n4];

DVSHGP_sin2D = xlsread(full_filename, 6);
% DVSHGP_sin2D_1 = create_data(DVSHGP_sin2D);
% DVSHGP_sin2D_equal = DVSHGP_sin2D(2:51, 1);
% DVSHGP_sin2D_unequal_1 = DVSHGP_sin2D(2:51, 5);
% DVSHGP_sin2D_unequal_2 = DVSHGP_sin2D(2:51, 9);
% DVSHGP_sin2D_1 = [DVSHGP_sin2D_equal, DVSHGP_sin2D_unequal_1, DVSHGP_sin2D_unequal_2];

NHGP_sinc = xlsread(full_filename, 1);
% NHGP_sinc_1 = create_data(NHGP_sinc);
% NHGP_sinc_equal = NHGP_sinc(2:51, 1);
% NHGP_sinc_unequal_1 = NHGP_sinc(2:51, 5);
% NHGP_sinc_unequal_2 = NHGP_sinc(2:51, 9);
% NHGP_sinc_1 = [NHGP_sinc_equal, NHGP_sinc_unequal_1, NHGP_sinc_unequal_2];

DVSHGP_sinc = xlsread(full_filename, 4);
% DVSHGP_sinc_1 = create_data(DVSHGP_sinc);
% DVSHGP_sinc_equal = DVSHGP_sinc(2:51, 1);
% DVSHGP_sinc_unequal_1 = DVSHGP_sinc(2:51, 5);
% DVSHGP_sinc_unequal_2 = DVSHGP_sinc(2:51, 9);
% DVSHGP_sinc_1 = [DVSHGP_sinc_equal, DVSHGP_sinc_unequal_1, DVSHGP_sinc_unequal_2];

NHGP_branin = xlsread(full_filename, 2);
% NHGP_branin_1 = create_data(NHGP_branin);
% NHGP_branin_equal = NHGP_branin(2:51, 1);
% NHGP_branin_unequal_1 = NHGP_branin(2:51, 5);
% NHGP_branin_unequal_2 = NHGP_branin(2:51, 9);
% NHGP_branin_1 = [NHGP_branin_equal, NHGP_branin_unequal_1, NHGP_branin_unequal_2];

DVSHGP_branin = xlsread(full_filename, 5);
% DVSHGP_branin_1 = create_data(DVSHGP_branin);
% DVSHGP_branin_equal = DVSHGP_branin(2:51, 1);
% DVSHGP_branin_unequal_1 = DVSHGP_branin(2:51, 5);
% DVSHGP_branin_unequal_2 = DVSHGP_branin(2:51, 9);
% DVSHGP_branin_1 = [DVSHGP_branin_equal, DVSHGP_branin_unequal_1, DVSHGP_branin_unequal_2];


%% plot figure
color1 = [255, 0, 0] / 255;
color2 = [0, 0, 255] / 255;
color3 = [0, 0, 0] / 255;

position_1 = (1:1:5);  % define position for first boxplots
position_2 = (6:1:10);  % define position for second boxplots
position_3 = (11:1:15);  % define position for third boxplots

Label_1 = {'n=100', 'n=200', 'n=500', 'n=1000', 'n=2500'};
Label_2 = {'n=500', 'n=1000', 'n=2500', 'n=5000', 'n=10^4'};
% Label_2 = {'n=200', 'n=1000', 'n=2000', 'n=5000'};

figure
box1 = boxplot(NHGP_branin(2:6, 1:5), 'colors', color1, 'Positions', position_1);
hold on;
box2 = boxplot(NHGP_branin(2:6, 6:10), 'colors', color2, 'Positions', position_2);
hold on;
box3 = boxplot(NHGP_branin(2:6, 11:15), 'colors', color3, 'Positions', position_3);
grid on; axis tight;

leg = findobj(gca,'Tag','Box'); % add legend
legend([leg(12), leg(6), leg(1)], ["equal", "unequal 1", "unequal 2"] );

set(gca, 'XGrid', 'off', 'XLim', [0, 16], 'YLim', [0, 2])
set(gca, 'xtick', (1:1:15), 'xticklabel', Label_2)
xtickangle(90)
ylabel('RMSE')

figure
box1 = boxplot(DVSHGP_branin(2:6, 1:5), 'colors', color1, 'Positions', position_1);
hold on;
box2 = boxplot(DVSHGP_branin(2:6, 6:10), 'colors', color2, 'Positions', position_2);
hold on;
box3 = boxplot(DVSHGP_branin(2:6, 11:15), 'colors', color3, 'Positions', position_3);
grid on; axis tight;

leg = findobj(gca,'Tag','Box'); % add legend
legend([leg(12), leg(6), leg(1)], ["equal", "unequal 1", "unequal 2"] );

set(gca, 'XGrid', 'off', 'XLim', [0, 16], 'YLim', [0, 2.5])
set(gca, 'xtick', (1:1:15), 'xticklabel', Label_2)
xtickangle(90)
ylabel('RMSE')

figure
box1 = boxplot(NHGP_sin2D(2:6, 1:5), 'colors', color1, 'Positions', position_1);
hold on;
box2 = boxplot(NHGP_sin2D(2:6, 6:10), 'colors', color2, 'Positions', position_2);
hold on;
box3 = boxplot(NHGP_sin2D(2:6, 11:15), 'colors', color3, 'Positions', position_3);
grid on; axis tight;

leg = findobj(gca,'Tag','Box'); % add legend
legend([leg(12), leg(6), leg(1)], ["equal", "unequal 1", "unequal 2"] );

set(gca, 'XGrid', 'off', 'XLim', [0, 16], 'YLim', [0, 0.3])
set(gca, 'xtick', (1:1:15), 'xticklabel', Label_2)
xtickangle(90)
ylabel('RMSE')

figure
box1 = boxplot(DVSHGP_sin2D(2:6, 1:5), 'colors', color1, 'Positions', position_1);
hold on;
box2 = boxplot(DVSHGP_sin2D(2:6, 6:10), 'colors', color2, 'Positions', position_2);
hold on;
box3 = boxplot(DVSHGP_sin2D(2:6, 11:15), 'colors', color3, 'Positions', position_3);
grid on; axis tight;

leg = findobj(gca,'Tag','Box'); % add legend
legend([leg(12), leg(6), leg(1)], ["equal", "unequal 1", "unequal 2"] );

set(gca, 'XGrid', 'off', 'XLim', [0, 16], 'YLim', [0.2, 0.6])
set(gca, 'xtick', (1:1:15), 'xticklabel', Label_2)
xtickangle(90)
ylabel('RMSE')

figure
box1 = boxplot(NHGP_sinc(2:6, 1:5), 'colors', color1, 'Positions', position_1);
hold on;
box2 = boxplot(NHGP_sinc(2:6, 6:10), 'colors', color2, 'Positions', position_2);
hold on;
box3 = boxplot(NHGP_sinc(2:6, 11:15), 'colors', color3, 'Positions', position_3);
grid on; axis tight;

leg = findobj(gca,'Tag','Box'); % add legend
legend([leg(12), leg(6), leg(1)], ["equal", "unequal 1", "unequal 2"] );

set(gca, 'XGrid', 'off', 'XLim', [0, 16], 'YLim', [0, 0.1])
set(gca, 'xtick', (1:1:15), 'xticklabel', Label_1)
xtickangle(90)
ylabel('RMSE')

figure
box1 = boxplot(DVSHGP_sinc(2:6, 1:5), 'colors', color1, 'Positions', position_1);
hold on;
box2 = boxplot(DVSHGP_sinc(2:6, 6:10), 'colors', color2, 'Positions', position_2);
hold on;
box3 = boxplot(DVSHGP_sinc(2:6, 11:15), 'colors', color3, 'Positions', position_3);
grid on; axis tight;

leg = findobj(gca,'Tag','Box'); % add legend
legend([leg(12), leg(6), leg(1)], ["equal", "unequal 1", "unequal 2"] );

set(gca, 'XGrid', 'off', 'XLim', [0, 16], 'YLim', [0, 0.05])
set(gca, 'xtick', (1:1:15), 'xticklabel', Label_1)
xtickangle(90)
ylabel('RMSE')




