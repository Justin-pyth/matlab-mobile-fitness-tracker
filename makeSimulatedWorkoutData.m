clear; clc; % file for making simulated data

n = 15; % num of workouts per class

% intensity features:
% low
lowSteps = randi([500, 1500], n, 1);
lowDuration = randi([10, 25], n, 1);  % minutes
lowDistance = lowSteps .* 2.2;  % feet, assume small stride
lowAvgPace = lowDistance ./ (lowDuration * 60);  % ft/sec
lowAvgAccel = rand(n, 1) * 0.2 + 0.1;
lowMaxAccel = lowAvgAccel + rand(n, 1) * 0.3;
lowAltGain = randi([0, 5], n, 1);
lowLabels = repmat("low", n, 1);

% medium
modSteps = randi([2000, 4000], n, 1);
modDuration = randi([20, 35], n, 1);
modDistance = modSteps .* 2.4;
modAvgPace = modDistance ./ (modDuration * 60);
modAvgAccel = rand(n, 1) * 0.3 + 0.3;
modMaxAccel = modAvgAccel + rand(n, 1) * 0.4;
modAltGain = randi([5, 15], n, 1);
modLabels = repmat("moderate", n, 1);

% high
highSteps = randi([5000, 9000], n, 1);
highDuration = randi([25, 50], n, 1);
highDistance = highSteps .* 2.5;
highAvgPace = highDistance ./ (highDuration * 60);
highAvgAccel = rand(n, 1) * 0.3 + 0.6;
highMaxAccel = highAvgAccel + rand(n, 1) * 0.5;
highAltGain = randi([15, 60], n, 1);
highLabels = repmat("high", n, 1);

% combining data into tbl
steps = [lowSteps; modSteps; highSteps];
duration = [lowDuration; modDuration; highDuration];
distance = [lowDistance; modDistance; highDistance];
avgPace = [lowAvgPace; modAvgPace; highAvgPace];
avgAccel = [lowAvgAccel; modAvgAccel; highAvgAccel];
maxAccel = [lowMaxAccel; modMaxAccel; highMaxAccel];
altGain = [lowAltGain; modAltGain; highAltGain];
intensity = categorical([lowLabels; modLabels; highLabels]);

WorkoutData = table(steps, duration, distance, avgPace, ...
                    avgAccel, maxAccel, altGain, intensity);

% saving to file so CL can access
save("WorkoutDataSimulated.mat", "WorkoutData");
disp("Simulated workout data created and saved to 'WorkoutDataSimulated.mat'")