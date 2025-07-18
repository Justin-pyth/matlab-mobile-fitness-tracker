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

newWorkout = table(newSteps, newDuration, newDistance, ...
                   newAvgPace, newAvgAccel, newMaxAccel, newAltGain);

% renaming column headers to match training table?
newWorkout.Properties.VariableNames = ...
    {'steps','duration','distance','avgPace','avgAccel','maxAccel','altGain'};

% using model to predict intensity of given workout
predictedIntensity = trainedModel.predictFcn(newWorkout);

disp(['Predicted Workout Intensity: ', char(predictedIntensity)]);