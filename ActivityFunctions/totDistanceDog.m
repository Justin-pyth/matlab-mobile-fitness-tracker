% Testing getting the total distance walked from the walking the dogs MATLAB sensor data

clear
load("Data/MixedActivity/walkingthedogs.mat");

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

totaldis_ft = totaldis*5280; 
disp(['The total distance traveled is: ', num2str(totaldis),' miles'])