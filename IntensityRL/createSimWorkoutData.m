clear; clc;

n = 20;  % number of workouts per level

% Low Intensity
lowSteps    = randi([300, 1500], n, 1);
lowDuration = randi([10, 25], n, 1);
lowDistance = lowSteps .* 2.2 / 5280; % convert to miles
lowAltGain  = randi([0, 10], n, 1);
lowAvgAccel = rand(n, 1) * 0.2 + 0.05;
lowMaxAccel = lowAvgAccel + rand(n, 1) * 0.4;

% Moderate Intensity
modSteps    = randi([2000, 4500], n, 1);
modDuration = randi([20, 40], n, 1);
modDistance = modSteps .* 2.4 / 5280;
modAltGain  = randi([10, 30], n, 1);
modAvgAccel = rand(n, 1) * 0.3 + 0.25;
modMaxAccel = modAvgAccel + rand(n, 1) * 0.6;

% High Intensity
highSteps    = randi([5000, 9000], n, 1);
highDuration = randi([30, 60], n, 1);
highDistance = highSteps .* 2.5 / 5280;
highAltGain  = randi([30, 100], n, 1);
highAvgAccel = rand(n, 1) * 0.4 + 0.5;
highMaxAccel = highAvgAccel + rand(n, 1) * 0.7;

%Compute Avg Pace (ft/sec)
lowAvgPace  = (lowDistance * 5280) ./ (lowDuration * 60);
modAvgPace  = (modDistance * 5280) ./ (modDuration * 60);
highAvgPace = (highDistance * 5280) ./ (highDuration * 60);

%Combine All 
steps      = [lowSteps; modSteps; highSteps];
duration   = [lowDuration; modDuration; highDuration];
distance   = [lowDistance; modDistance; highDistance];
avgPace    = [lowAvgPace; modAvgPace; highAvgPace];
avgAccel   = [lowAvgAccel; modAvgAccel; highAvgAccel];
maxAccel   = [lowMaxAccel; modMaxAccel; highMaxAccel];
altGain    = [lowAltGain; modAltGain; highAltGain];

% Intensity Scoring Logic
% Normalize features between 0–1 (rough scale)
stepsNorm    = normalize(steps, 'range');
paceNorm     = normalize(avgPace, 'range');
accelNorm    = normalize(avgAccel, 'range');
altNorm      = normalize(altGain, 'range');

% Weighted formula to simulate realistic intensity perception
intensityScore = ...
    0.30 * stepsNorm + ...
    0.25 * paceNorm + ...
    0.25 * accelNorm + ...
    0.20 * altNorm;

% Scale to 1–10
intensityScore = round(1 + 9 * intensityScore, 1);

WorkoutData = table(steps, duration, distance, avgPace, avgAccel, maxAccel, altGain, intensityScore);
save("IntensityRL/SimWorkouts.mat", "WorkoutData");
disp("Simulated and saved: IntensityRL/SimWorkouts.mat");

