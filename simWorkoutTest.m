%first run makeSimulatedWorkoutData.m
%run 'classificationLearner' in the terminal
%press'New Session > From Workspace'
%press 'WorkoutData' as the dataset
%press 'intensity' as the response, then start session

%press 'all quick to train'
%press train all

%click best model in accuracy, or speed (obs/sec)
%export model to workspace

% if you named the model anything other than
% 'trainedModel', make sure you change the variable below

% now run this file to test the trained model on more simulated data:


% FAKE WORKOUTT:
newSteps = 3200;
newDuration = 30; % min
newDistance = newSteps * 2.4;
newAvgPace = newDistance / (newDuration * 60);
newAvgAccel = 0.4;
newMaxAccel = 0.6;
newAltGain = 12;

simWorkout = table(newSteps, newDuration, newDistance, ...
                   newAvgPace, newAvgAccel, newMaxAccel, newAltGain);

% renaming column headers to match training table
simWorkout.Properties.VariableNames = ...
    {'steps','duration','distance','avgPace','avgAccel','maxAccel','altGain'};

% using model to predict intensity (pI) of given workout

pIforSimulatedData = trainedModel.predictFcn(simWorkout);
disp(['Predicted Workout Intensity for Simulated Data: ', char(pIforSimulatedData)]);


%%
file = "Data/MixedActivity/walkingthedogs.mat";
addpath("ActivityFunctions")

steps = getTotalSteps(file);
duration = getDuration(file);
distance = getDistance(file);
[avgAccel, maxAccel] = getAvgMaxAccel(file);
altGain = getAltitudeGain(file);

avgPace = distance / (duration * 60);

dogWorkout = table(steps, duration, distance, avgPace, avgAccel, maxAccel, altGain);

dogWorkout.Properties.VariableNames = {'steps','duration','distance','avgPace','avgAccel','maxAccel','altGain'};

% predicting now:
pIforWalkingDogsData = trainedModel.predictFcn(dogWorkout);
disp(['Predicted Intensity for walking dogs: ', char(pIforWalkingDogsData)]);