function score = predictIntensityFromSummary(workout, trainedModel)
    % Uses the trained machine learning model to predict the intensity of a workout based on MATLAB sensor data
    
    score = trainedModel.predictFcn(workout);
end