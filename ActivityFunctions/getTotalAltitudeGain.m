function altGain = getTotalAltitudeGain(file)
    % Display the total altitude climbed based on MATLAB sensor data

    data = load(file);

    
    if isfield(data, 'Position') && istimetable(data.Position)
        altitudes = data.Position.altitude;  % or Altitude depending on your data
        deltaAlt = diff(altitudes);
        gain = sum(deltaAlt(deltaAlt > 0));
        altGain = gain * 3.28084;  % meters → feet
    else
        warning('Position data not found or is not a timetable.');
        altGain = NaN;
    end
end