function updateEffortGraph1(app)
    if length(app.workoutLabels) ~= length(app.workoutQuery)
        warning("Mismatch between labels and scores. Skipping plot.");
        return;
    end

    labels = categorical(app.workoutLabels);
    scores = double(app.workoutQuery);

    cla(app.EffortGraph);
    barh(app.EffortGraph, labels, scores);
    title(app.EffortGraph, 'Analyzing Workout Efforts');
    xlabel(app.EffortGraph, 'Predicted Intensity Score');
    xlim(app.EffortGraph, [0 10]);
end