%0. Run createSimWorkoutData.m
%1. Click "New Session > From Workspace"
%2.	Choose WorkoutData
%3.	Set intensityScore as the response
%4.	Click "All Quick-to-Train", then "Train All"
%5.	Select the best model (based on RMSE or R²)
%6.	Click "Export Model" (to workspace, name: trainedModel)

% if you named the model anything other than
% 'trainedModel', make sure you change the variable below

% now run this file to test the trained model on more simulated data:
%%
regressionLearner

%% 

% Simulated Fake Workout
newSteps = 6200;
newDuration = 30; % min
newDistance = newSteps * 2.4;
newAvgPace = (newDistance * 5280) / (newDuration * 60);
newAvgAccel = 0.5;
newMaxAccel = 0.9;
newAltGain = 20;

simWorkout = table(newSteps, newDuration, newDistance, newAvgPace, newAvgAccel, newMaxAccel, newAltGain);

% renaming column headers to match training table
simWorkout.Properties.VariableNames = {'steps','duration','distance','avgPace','avgAccel','maxAccel','altGain'};

% Predict numeric score
predictedScore = trainedModel.predictFcn(simWorkout);
disp(['Predicted Intensity Score for simulated data (1–10): ', num2str(predictedScore, '%.2f')]);
%%
file = "Data/MixedActivity/kevin_longrun1.mat";
addpath("ActivityFunctions")

steps = getTotalSteps(file);
duration = getDuration(file);
distance = getDistance(file);
[avgAccel, maxAccel] = getAvgMaxAccel(file);
altGain = getAltitudeGain(file);

avgPace = (distance * 5280) / (duration * 60);

runLongWorkout = table(steps, duration, distance, avgPace, avgAccel, maxAccel, altGain);

runLongWorkout.Properties.VariableNames = {'steps','duration','distance','avgPace','avgAccel','maxAccel','altGain'};

% predicting now:
predictedScore2 = trainedModel.predictFcn(runLongWorkout);
disp(['Predicted Intensity Score for running long: ', num2str(predictedScore2, '%.2f')]);
%%
file1 = "Data/MixedActivity/kevin_shortrun1.mat";
addpath("ActivityFunctions")

steps = getTotalSteps(file1);
duration = getDuration(file1);
distance = getDistance(file1);
[avgAccel, maxAccel] = getAvgMaxAccel(file1);
altGain = getAltitudeGain(file1);

avgPace = (distance * 5280) / (duration * 60);

shortRunWorkout = table(steps, duration, distance, avgPace, avgAccel, maxAccel, altGain);

shortRunWorkout.Properties.VariableNames = {'steps','duration','distance','avgPace','avgAccel','maxAccel','altGain'};

% predicting now:
predictedScore3 = trainedModel.predictFcn(shortRunWorkout);
disp(['Predicted Intensity Score for running short: ', num2str(predictedScore3, '%.2f')]);

%%
disp("hi");

%%
trained = load('trainedModel.mat');
trainedModel = trained.trainedModel;
%trainedModel.PredictorNames

trainedModel.predictFcn
trainedModel.RequiredVariables

%%
whos('-file', 'trainedModel.mat')
%% 
trainedModel.RequiredVariables

%%
load('userHistory.mat')
userHistory
%% 
trained = load('trainedModel.mat');
trainedModel = trained.trainedModel;

% Create an empty table with same variable names
userHistory = array2table(zeros(0, numel(trainedModel.RequiredVariables)), ...
    'VariableNames', trainedModel.RequiredVariables);

% Save cleared history
save('userHistory.mat', 'userHistory');

userHistory
%% 
userHistory