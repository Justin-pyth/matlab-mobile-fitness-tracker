function steps = getTotalSteps(filename)
    load(filename);
    addpath("ActivityFunctions");

% Extract acceleration and time
X = Acceleration.X;
Y = Acceleration.Y;
Z = Acceleration.Z;
accelTime = getTimeElapsed(Acceleration.Timestamp);  % convert timestamps to seconds

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

    steps = length(pks);
end