function elapsedSec = getTimeElapsedImproved(datetime_array)
    elapsedSec = seconds(datetime_array - datetime_array(1));
end