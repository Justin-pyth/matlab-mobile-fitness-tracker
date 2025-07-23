function duration_min = getDuration(filename)
    %%This function converts get total duration and converts from hours
    % to minutes

    load(filename);
    time = getTimeElapsed(Position.Timestamp);
    duration_min = time(end) / 60;
end