function altGain = getAltitudeGain(filename)
    load(filename);
    altGain = max(Position.altitude) - min(Position.altitude);
end