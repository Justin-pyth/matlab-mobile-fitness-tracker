%Test file to get total steps take from walking the dogs MATLAB sensor data

clear
load("Data/MixedActivity/walkingthedogs.mat");

% Extract acceleration and time
X = Acceleration.X;
Y = Acceleration.Y;
Z = Acceleration.Z;
accelTime = timeElapsed(Acceleration.Timestamp);  % convert timestamps to seconds

% Calculate acceleration magnitude and remove gravity
accMag = sqrt(X.^2 + Y.^2 + Z.^2);
accMag = accMag - mean(accMag);  % remove constant offset due to gravity

% Estimate sampling rate (Hz)
samplingRate = 1 / mean(diff(accelTime));

% Detect peaks in the signal
minPeakHeight = std(accMag);              % adaptive threshold based on variation
minPeakDistance = round(0.4 * samplingRate);  % ~1 step every 0.4s minimum

[pks, ~] = findpeaks(accMag, 'MinPeakHeight', minPeakHeight, ...
                                 'MinPeakDistance', minPeakDistance);

% Count steps
steps = length(pks);

% Display result
disp(['Estimated steps (from accelerometer): ', num2str(steps)]);
