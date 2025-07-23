function [pace] = calculatePace(filename)
    %This functions calculates for the average pace for any activity

    totalDistance = getDistance(filename); %miles
    totalTime = getDuration(filename); %mins
    pace = totalTime/totalDistance; %mins/mile
end