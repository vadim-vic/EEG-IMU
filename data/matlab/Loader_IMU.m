% Loader
fname_load = '20251030_Phone_IMU.csv';
%table_src = load_imu_data(fname_load); The automatically generated file
% does not work.
load('PhoneIMU');
table_src = PhoneIMU;
data = table_src{:,2:end};
data_captions = {'gFx','gFy','gFz','ax','ay','az','wx','wy','wz','Bx','By','Bz'};

time = table_src{:,1};
time = time - time(1);

time_start = 1;
time_end = size(time) - time_start;
time_idx = time_start : time_end;

fig = fig_makeup();

%for i = 1:4
idx = 1:12;
plot(time(time_idx), data(time_idx,idx), 'LineWidth',1);
axis tight
xlabel('Time (s)');
ylabel('IMU');
legend(data_captions(idx));
fname = ['IMU_', num2str(0),'.png'];
saveas(fig, fname);
%end