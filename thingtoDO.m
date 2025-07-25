%make file tolowkey the bar charts tweak out at the lower ranges
%i think its cause i havent fully implemented the real data into the 
%workout data that the regression model is trained on
%im gonna make a new file that processes the raw sensor 
%data to be able to manuelly add an intensity score, and do that 
% %with all the workout data, so i can plug that into the workout data table

load('Data/MixedActivity/justin_running.mat');
whos                                 % List all loaded variables
fieldnames(justin_running)           % If it's a struct
justin_running.accel                 % Access field, if available
%% 

disp('hi')
%% 
%appendWorkoutWithLabel("MATLAB_DRIVE/MobileSensorData/mediumWalk_tenzin.mat");
%appendWorkoutWithLabel("MATLAB_DRIVE/MobileSensorData/mediumWalk2_tenzin.mat");
%appendWorkoutWithLabel("MATLAB_DRIVE/MobileSensorData/mediumWalk3_tenzin.mat");

%appendWorkoutWithLabel("Data/Sitting/justin_sitting.mat");
%appendWorkoutWithLabel("Data/Sitting/kevin_sitting.mat");

%appendWorkoutWithLabel("Data/MixedActivity/kevin_longrun1.mat");
%appendWorkoutWithLabel("Data/MixedActivity/kevin_hike1.mat");
%appendWorkoutWithLabel("Data/MixedActivity/kevin_longrun1.mat");
%appendWorkoutWithLabel("Data/MixedActivity/kevin_shortrun1.mat");
%appendWorkoutWithLabel("Data/MixedActivity/kevin_standing2.mat");
%appendWorkoutWithLabel("Data/MixedActivity/kevin_walkingandstanding.mat");
%appendWorkoutWithLabel("Data/MixedActivity/sensorlog_20250711_134319 Walking + standing still (1).mat");
%appendWorkoutWithLabel("Data/MixedActivity/walkingAndStandingInHousehold.mat");





