test = 0 %[output:3754eada]
%%
function steps = stepsFromGPS(lat, lon, strideLength)
    if nargin < 3
        strideLength = 2.5; % Default stride in feet
    end

    earthCirc = 24901; % Earth's circumference in miles
    totalDist = 0;

    for i = 1:(length(lat)-1) % we're comparing pairs of long and lat from the data
        lat1 = lat(i); % one gps point to another
        lon1 = lon(i);
        lat2 = lat(i+1);
        lon2 = lon(i+1);

        degDist = distance(lat1, lon1, lat2, lon2);  % degrees
        distMiles = (degDist/360) * earthCirc;      % miles
        totalDist = totalDist + distMiles; % maths to get final dist
    end

    totalDist_ft = totalDist * 5280;  % converting miles to feet
    steps = totalDist_ft / strideLength; %stride length can change here
end
%%
function steps = stepsFromAccel(X, Y, Z, accelTime)
    if nargin < 4
        error('Must provide X, Y, Z acceleration and time vectors.');
    end

    % Calculating magnitude of acceleration
    accMag = sqrt(X.^2 + Y.^2 + Z.^2);
    accMag = accMag - mean(accMag);  % getting rid of gravity

    % Detect peaks (assuming one per step)
    minPeakHeight = std(accMag);     % adaptive threshold, getting rid of small bumps
    samplingRate = 1 / mean(diff(accelTime)); % estimate Hz or how many times per second we are getting data points
    minPeakDistance = round(0.4 * samplingRate); % ~1.5–2.5 Hz step rate, (for getting just the peaks at least some amount of samples apart)

    [pks, ~] = findpeaks(accMag, 'MinPeakHeight', minPeakHeight, ...
                                     'MinPeakDistance', minPeakDistance);

    steps = length(pks);  % each peak assumed one step
end
%%
load('ExampleData.mat');
lat = Position.latitude;
lon = Position.longitude;

steps = stepsFromGPS(lat, lon, 2.4);  % 2.5 ft is the default tho
disp(['Steps (from GPS): ', num2str(steps)]); %[output:477cc268]
%%
load('ExampleData.mat');
X = Acceleration.X;
Y = Acceleration.Y;
Z = Acceleration.Z;
accelTime = timeElapsed(Acceleration.Timestamp);

steps = stepsFromAccel(X, Y, Z, accelTime);
disp(['Steps (from Accelerometer): ', num2str(steps)]); %[output:43e401ac]

%[appendix]{"version":"1.0"}
%---
%[metadata:view]
%   data: {"layout":"onright","rightPanelPercent":13.1}
%---
%[output:3754eada]
%   data: {"dataType":"textualVariable","outputData":{"name":"test","value":"0"}}
%---
%[output:477cc268]
%   data: {"dataType":"text","outputData":{"text":"Steps (from GPS): 900.4703\n","truncated":false}}
%---
%[output:43e401ac]
%   data: {"dataType":"text","outputData":{"text":"Steps (from Accelerometer): 679\n","truncated":false}}
%---
