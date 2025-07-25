function totalCalBurned = calculateTotCaloriesBurned(weight,activity)
    %This function computes the total calories burned from a single
    % workout.
    % Activity needs to have labels in order to calculate MET.

    %Compute the total duration of an activty to seconds
    totTime = seconds(activity.Acceleration.Timestamp(end) - ...
        activity.Acceleration.Timestamp(1));

    %Convert seconds to hours
    totTime = totTime/3600;

    %Compute total time to time per row
    durPerRow = totTime/size(activity.Acceleration, 1);

    %%Calculate MET
    totalCalBurned = 0;
    MET = [1.3, 3.5, 8.0]; %standing/sitting, walking, running
    
    %Creates logical index for each activity type
    %creates a vector array filled with 0's, and assigns 1 if it starts
    %with the letter
    %Also convert activity. from char to string for startsWith() to work
    isRunning = startsWith(string(activity.Acceleration.Activity), 'r');
    isWalking = startsWith(string(activity.Acceleration.Activity), 'w');
    isSitting = startsWith(string(activity.Acceleration.Activity), 's');
    
     
    %Create an array and assigns MET values to the array
    %example: 0, 0, 0, 0 ... will become 1.30, 1.30, 8.00, 3.50 ...
    METtemp = zeros(size(activity.Acceleration.Activity)); 
    METtemp(isRunning) = MET(3);
    METtemp(isWalking) = MET(2);
    METtemp(isSitting) = MET(1);

    %Calculate total calories
    totalCalBurned = sum(METtemp * weight * durPerRow);

    %Iterative Method
    % for i = 1:size(activity.Acceleration, 1)
    %     if strncmp(activity.Acceleration.Activity(i), "r", 1)
    %         METtemp = MET(3);
    %     elseif strncmp(activity.Acceleration.Activity(i), "w", 1)
    %         METtemp = MET(2);
    %     elseif strncmp(activity.Acceleration.Activity(i), "s", 1)
    %         METtemp = MET(1);
    %     end
    % 
    %     %Add calories burned per timestap to total
    %     totalCalBurned = totalCalBurned + (METtemp * weight * durPerRow);
    % end
end

