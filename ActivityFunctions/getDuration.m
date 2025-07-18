function duration_min = getDuration(filename)
    load(filename);
    time = getTimeElapsed(Position.Timestamp);
    duration_min = time(end) / 60;
end