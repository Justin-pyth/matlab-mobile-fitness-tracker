function altGain = getAltitudeGain(filename, yfitdata)
    %This function retrieves the total elevation gain from a workout.
    %Segments where the user goes uphill is considered elevation gain.

    load(filename);
    
    Position.Label = yfitdata; %attach label to Position graph
    index = startsWith(yfitdata, "u"); %get index for label with uphill
   
    elevationGain = Position.altitude(index); %only retrieve uphill values
    
    %gets the diff of two points (e.g. [101, 109, 115] = [+8, +6])
    uphillDiff = diff(elevationGain); %gets the diff of two points 
    
    % sum if difference is greater than 0 (e.g. [-2, +5] -> [+5])
    positiveGain = sum(uphillDiff(uphillDiff > 0));  

    altGain = positiveGain * 3.28084; % convert meter to feet
end