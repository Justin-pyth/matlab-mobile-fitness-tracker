function distanceMiles = getDistance(filename)
%GETDISTANCE Calculates the total distance in miles from a MAT file
%   filename: path to a .mat file with Position.latitude and Position.longitude

    load(filename);

    lat = Position.latitude;
    lon = Position.longitude;
    earthCirc = 24901;  % in miles
    totaldis = 0;

    for i = 1:(length(lat)-1)
        lat1 = lat(i);     % The first latitude
        lat2 = lat(i+1);   % The second latitude
        lon1 = lon(i);     % The first longitude
        lon2 = lon(i+1);   % The second longitude

        degDis = distance(lat1, lon1, lat2, lon2);  % angular distance in degrees
        dis = (degDis/360) * earthCirc;            % convert to miles
        totaldis = totaldis + dis;
    end

    distanceMiles = totaldis;  % return distance in miles
end