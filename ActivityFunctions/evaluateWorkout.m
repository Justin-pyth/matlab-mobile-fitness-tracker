function [globalScore, relativeScore] = evaluateWorkout(workout, userID, trainedModel)
    updateUserHistory(workout, userID);

    historyFile = fullfile('UserData', sprintf('user_%s_history.mat', userID));
    load(historyFile, 'userHistory');
    
    globalScore = predictIntensityFromSummary(workout, trainedModel);
    relativeScore = getRelativeIntensity(workout, userHistory);
end