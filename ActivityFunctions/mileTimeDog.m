clear
load("Data/MixedActivity/walkingthedogs.mat");

% Test function to get mile time based on walking the dogs sensor data

%Variable Initialization
lat = Position.latitude;
lon = Position.longitude;
earthCirc = 24901;
totaldis = 0;

%Functions for Distance
for i = 1:(length(lat)-1)
    lat1 = lat(i);     % The first latitude
    lat2 = lat(i+1);   % The second latitude
    lon1 = lon(i);     % The first longitude
    lon2 = lon(i+1);   % The second longitude
    degDis = distance(lat1, lon1, lat2, lon2);
    dis = (degDis/360)*earthCirc;
    totaldis = totaldis + dis;
end

times = Position.Timestamp;
time = timeElapsed(times);
totTimeH = time(end,1)/3600;
miletime = totaldis/totTimeH

