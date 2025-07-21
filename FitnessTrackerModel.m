%% Contributors: Kevin, Tenzin, Justin
% Project: Fitness Tracker Model

%% Get all accelerations from folders and assign them to a variable
clear all;
clc;
allAcceleration = getAllAccelerations();
allAcceleration = timetable2table(allAcceleration, "ConvertRowTimes", false);

%% Run classificationLeaner and test allAccelerations
classificationLearner

%% Train the model
activity = load(fullfile('Data/MixedActivity/kevin_longrun1.mat'));
justAcc = timetable2table(activity.Acceleration, "ConvertRowTimes", false); %remove timestamps
yfit = trainedModel.predictFcn(justAcc); % train the model picked out from classficationLearner
activity.Acceleration.Activity = yfit; % add activity vector label to activity

% Calculate total calories burned
weight = 86.1826; %I chose an arbitary value for weight
totCaloriesBurned = calculateTotCaloriesBurned(weight,activity) 

%% Plot on pie chart
yfitcat = categorical(cellstr(yfit)); % convert to correct data type for histogram
plotTotalCalBurned(totCaloriesBurned, yfitcat);

%% Run the app and store user input
app = FitnessTracker();

% Load and assign values from userData struct
load("userData.mat");

