%Contributors: Kevin, Tenzin, Justin
%Project: Fitness Tracker Model

clear;
close all;
clear;

% Runs the app and stores user input
app = app1();

% Load and assign values from userData struct
load("userData.mat")

%% Currently not being used, but created variables for future func calls
weight = userData.weight;
height = userData.height;
age = userData.height;
activityLvl = userData.activityLvl;
gender = userData.gender;


%% Get all accelerations from folders and assign them to a variable
clear all;
clc;

allAcceleration = getAllAccelerations();
allAcceleration = timetable2table(allAcceleration, "ConvertRowTimes", false);

%%Run classificationLeaner and test allAccelerations
classificationLearner

%% Train model
% For this example, I am graphing my activity when I walked my dogs

walkTheBoysAcceleration = load(fullfile('Data/MixedActivity/walkingthedogs.mat'));
justAcc = timetable2table(walkTheBoysAcceleration.Acceleration, "ConvertRowTimes", false);
yfit = trainedModel.predictFcn(justAcc);

% Plot on pie chart
yfitcat = categorical(cellstr(yfit)); % convert to correct data type for histogram
pie(yfitcat);