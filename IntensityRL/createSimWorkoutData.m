clear; clc;

n = 15;  % workouts per level

% LOW intensity
lowSteps = randi([500, 1500], n, 1);
lowDuration = randi([10, 25], n, 1);
lowDistance = lowSteps .* 2.2;
lowAvgPace = lowDistance ./ (lowDuration * 60);
lowAvgAccel = rand(n, 1) * 0.2 + 0.1;
lowMaxAccel = lowAvgAccel + rand(n, 1) * 0.3;
lowAltGain = randi([0, 5], n, 1);
lowIntensity = randi([1, 3], n, 1); 

% MODERATE intensity 
modSteps = randi([2000, 4000], n, 1);
modDuration = randi([20, 35], n, 1);
modDistance = modSteps .* 2.4;
modAvgPace = modDistance ./ (modDuration * 60);
modAvgAccel = rand(n, 1) * 0.3 + 0.3;
modMaxAccel = modAvgAccel + rand(n, 1) * 0.4;
modAltGain = randi([5, 15], n, 1);
modIntensity = randi([4, 7], n, 1); 

% HIGH intensity
highSteps = randi([5000, 9000], n, 1);
highDuration = randi([25, 50], n, 1);
highDistance = highSteps .* 2.5;
highAvgPace = highDistance ./ (highDuration * 60);
highAvgAccel = rand(n, 1) * 0.3 + 0.6;
highMaxAccel = highAvgAccel + rand(n, 1) * 0.5;
highAltGain = randi([15, 60], n, 1);
highIntensity = randi([8, 10], n, 1);  

% Combine all into a table
steps = [lowSteps; modSteps; highSteps];
duration = [lowDuration; modDuration; highDuration];
distance = [lowDistance; modDistance; highDistance];
avgPace = [lowAvgPace; modAvgPace; highAvgPace];
avgAccel = [lowAvgAccel; modAvgAccel; highAvgAccel]; %feet/sec
maxAccel = [lowMaxAccel; modMaxAccel; highMaxAccel];
altGain = [lowAltGain; modAltGain; highAltGain];
intensityScore = [lowIntensity; modIntensity; highIntensity];

WorkoutData = table(steps, duration, distance, avgPace, ...
    avgAccel, maxAccel, altGain, intensityScore);

save("IntensityRL/SimWorkouts.mat", "WorkoutData");
disp("Simulated regression workout data created and saved.");