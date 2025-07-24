function totalCalBurned = calculateTotCaloriesBurned(weight,activity)

    %Compute the total duratiokn of the activty to seconds
    totTime = seconds(activity.Acceleration.Timestamp(end) - ...
        activity.Acceleration.Timestamp(1));

    %Convert seconds to hours
    totTime = totTime/3600;

    %Compute total time to time per row
    durPerRow = totTime/size(activity.Acceleration, 1);

    %%Calculate MET
    totalCalBurned = 0;
    MET = [1.3, 3.5, 8.0]; %standing/sitting, walking, running
    
    %Iterate and compare first letter of activities
    for i = 1:size(activity.Acceleration, 1)
        if strncmp(activity.Acceleration.Activity(i), "r", 1)
            METtemp = MET(3);
        elseif strncmp(activity.Acceleration.Activity(i), "w", 1)
            METtemp = MET(2);
        elseif strncmp(activity.Acceleration.Activity(i), "s", 1)
            METtemp = MET(1);
        end
    
        %Add calories burned per timestap to total
        totalCalBurned = totalCalBurned + (METtemp * weight * durPerRow);
    end
end

