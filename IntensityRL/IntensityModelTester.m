% Regression Learner syntax:
regressionLearner

%%
% Predict Fake Workout

fakeSteps = 6200;
fakeDuration = 30; % min
fakeDistance = fakeSteps * 2.4;
fakeAvgPace = (fakeDistance * 5280) / (fakeDuration * 60);
fakeAvgAccel = 0.5;
fakeMaxAccel = 0.9;
fakeAltGain = 20;

Workout1 = table(fakeSteps, fakeDuration, fakeDistance, fakeAvgPace, fakeAvgAccel, fakeMaxAccel, fakeAltGain);
Workout1.Properties.VariableNames = {'steps','duration','distance','avgPace','avgAccel','maxAccel','altGain'};

% predicting now:
predictedScore = trainedModel.predictFcn(Workout1);
disp(['Predicted Intensity Score for simulated data (1–10): ', num2str(predictedScore, '%.2f')]);
%%
%Predict Real Work

file = "Data/MixedActivity/kevin_longrun1.mat";
addpath("ActivityFunctions")

teststeps2 = getTotalSteps(file);
testduration2 = getDuration(file);
testdistance2 = getDistance(file);
[testAvgAccel2, testMaxAccel2] = getAvgMaxAccel(file);
testAltGain2 = getTotalAltitudeGain(file);
testAvgPace2 = (testdistance2 * 5280) / (testduration2 * 60);

runLongWorkout = table(teststeps2, testduration2, testdistance2, testAvgPace2, testAvgAccel2, testMaxAccel2, testAltGain2);
runLongWorkout.Properties.VariableNames = {'steps','duration','distance','avgPace','avgAccel','maxAccel','altGain'};

% predicting now:
predictedScore2 = trainedModel.predictFcn(runLongWorkout);
disp(['Predicted Intensity Score for running long: ', num2str(predictedScore2, '%.2f')]);
%%
%Predict More Real Work

file1 = "Data/MixedActivity/kevin_shortrun1.mat";
addpath("ActivityFunctions")

teststeps2 = getTotalSteps(file1);
testduration2 = getDuration(file1);
testdistance2 = getDistance(file1);
[testAvgAccel2, testMaxAccel2] = getAvgMaxAccel(file1);
testAltGain2 = getTotalAltitudeGain(file1);
testAvgPace2 = (testdistance2 * 5280) / (testduration2 * 60);

shortRunWorkout = table(teststeps2, testduration2, testdistance2, testAvgPace2, testAvgAccel2, testMaxAccel2, testAltGain2);
shortRunWorkout.Properties.VariableNames = {'steps','duration','distance','avgPace','avgAccel','maxAccel','altGain'};

% predicting now:
predictedScore3 = trainedModel.predictFcn(shortRunWorkout);
disp(['Predicted Intensity Score for running short: ', num2str(predictedScore3, '%.2f')]);
%% 
trained = load('trainedModel.mat');
trainedModel = trained.trainedModel;
addpath("IntensityRL");

% Create an empty table with same variable names
userHistory = array2table(zeros(0, numel(trainedModel.RequiredVariables)), ...
    'VariableNames', trainedModel.RequiredVariables);

% Save cleared history
save('IntensityRL/userHistory.mat', 'userHistory');

userHistory
%%
% Manually running appendWorkoutWithLabel function to all essential sensor
% data to add onto WorkoutData file

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
%% 
% Code below to append simulated data onto WorkoutData file
% *Recommended for WorkoutData file to be already filled in with real 
% data using appendWorkoutWithLabel function

% Load both tables
sim = load("IntensityRL/SimWorkouts.mat", "WorkoutData");
real = load("WorkoutData.mat", "WorkoutData");

% Rename the column in simulated data
sim.WorkoutData.Properties.VariableNames{'intensityScore'} = 'intensity';

% Combine the two
WorkoutData = [real.WorkoutData; sim.WorkoutData];

% Save the updated table
save("IntensityRL/WorkoutData.mat", "WorkoutData");
disp("Simulated data successfully appended to WorkoutData.mat");
%%

disp("This is a line break you can use to debug!")