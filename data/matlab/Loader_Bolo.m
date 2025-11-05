% Loader
fname_load = 'Bolo-2025-10-30-13-04-24.csv';
table_src = load_bolo_data(fname_load);
data = table_src{:,2:end};

time_str = table_src{:,1};
time = datetime(time_str,'InputFormat', 'MM/dd/yyyy HH:mm:ss.SSS', ...
    'TimeZone', 'UTC');
time = second(time, 'secondofday');
time = time - time(1);

time_start = 1;
time_end = size(time) - time_start;
time_idx = time_start : time_end;

fig = fig_makeup();

plot(time(time_idx), data(time_idx,:), 'LineWidth',1);
axis tight
xlabel('Time (s)');
ylabel('Bolo');
fname = ['bolo_', '1','.png'];
saveas(fig, fname);
