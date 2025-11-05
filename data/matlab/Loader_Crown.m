% APTest_HRV_Loader
% The data file:
% sub-P001_ses-S001_task-Default_run-001_eeg_Crown-375_data
% The rest:
% 20251030_APTest_HRV
% 20251030_Phone_IMU
% Bolo-2025-10-30-13-04-24
%
set(0, 'DefaultAxesFontName', 'Times New Roman');
set(0, 'DefaultAxesFontSize', 12);
set(0, 'DefaultTextFontName', 'Times New Roman');
fig = gcf;
fname_load = 'sub-P001_ses-S001_task-Default_run-001_eeg_Crown-375_data.csv';
crown_data = table2array(load_crown_data(fname_load));
crown_time = (crown_data(:,1) - crown_data(1,1)); % time in seconds
crown_data = crown_data(:,2:end)/1000; % signal in mV or µV

channel_idx = [3];%[1,3,4,5,6,8];%[2,7];%[3,4];%%[2,7];%;%1:8;% 1 is offset 
time_start = 408*250;% 6100;
time_end = time_start + 10 * 250; % 250 is 1 sec, Hz;
%time_end = size(crown_time) - time_start;
time_idx = time_start : time_end;

%isinteger(x)
plot(crown_time(time_idx), crown_data(time_idx,channel_idx));%, 'LineWidth',1);
axis tight
xlabel('Time (s)');
ylabel('EEG (µV)');
channel_labels = arrayfun(@(x) sprintf('Ch %d', x), channel_idx, 'UniformOutput', false);
legend(channel_labels,'FontName', 'Times New Roman', 'FontSize', 12);
% set(gca, 'FontName', 'Times New Roman', 'FontSize', 12);
fname = 'eeg_crown_x.png';
saveas(fig, fname);
% close(fig);

%fig = gcf;
%histogram(diff(crown_time)); % title 'Distribution of Differences' 
%xlabel('Difference Value');
%ylabel('Frequency');
%disp(crown_data(1,1))