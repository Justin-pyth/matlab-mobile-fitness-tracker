function score = predictIntensityFromSummary(workout, trainedModel)
    score = trainedModel.predictFcn(workout);
end