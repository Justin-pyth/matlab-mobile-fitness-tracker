function [lat,lon,alt] = getLatLotAlt(filename)
    % This functions returns the longitude, latitude, and altitude of the
    % workout. It loads the file and returns them.
    load(filename)

    lat = Position.latitude; 
    lon = Position.longitude; 
    alt = Position.altitude; 
end