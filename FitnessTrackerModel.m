%% Contributors: Kevin, Tenzin, Justin
% Project: Fitness Tracker Model

%% Get all accelerations from folders and assign them to a variable
clear all;
clc;
allAcceleration = getAllAccelerations();
allAcceleration = timetable2table(allAcceleration, "ConvertRowTimes", false);

%% Get all altitudes from folders and assign them to a variable
allAltitudes = getAltitudeImproved();
%allAltitudes.time = second(allAltitudes.Timestamp);
allAltitudes = timetable2table(allAltitudes, "ConvertRowTimes", false);

%% Run classificationLeaner and test allAccelerations
classificationLearner

%% Run the app and store user input
app = FitnessTracker();
