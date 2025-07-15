function totalCalBurned = calculateTotCaloriesBurned(weight,activity)

    %Compute the total duratiokn of the activty to seconds
    totTime = seconds(activity.Acceleration.Timestamp(end) - ...
        activity.Acceleration.Timestamp(1));

    %Convert seconds to hours
    totTime = totTime/3600;
    durPerEachRow = totTime/size(activity.Acceleration, 1);

    %%Calculate MET
    
end