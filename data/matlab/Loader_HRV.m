% Loader
fname_load = '20251030_APTest_HRV.csv';
data = load_hrv_data(fname_load);

time_str = data{:,3};
time = datetime(time_str, 'InputFormat', 'H:mm:ss');
time = second(time, 'secondofday');

captions = {'HRT','NN','SDNN','RMSSD','TP','VLF','LF','HF','LFHF','LFNORM','HFNORM'};
data = data{:,5:end}; % change the datatype and beg for forgiveness
%size(hrv_captions)
%size(hrv_matrix,2)

time_start = 1;% 6100;
%time_end = time_start + 10;
time_end = size(time) - time_start;
time_idx = time_start : time_end;

set(0, 'DefaultAxesFontName', 'Times New Roman');
set(0, 'DefaultAxesFontSize', 12);
set(0, 'DefaultTextFontName', 'Times New Roman');

for i = 1:11
    fig = gcf;
    plot(time(time_idx), data(time_idx,i), 'LineWidth',1);
    axis tight
    xlabel('Time (s)');
    ylabel(captions{i});
    fname = ['_hrv_', captions{i},'.png'];
    saveas(fig, fname);
end