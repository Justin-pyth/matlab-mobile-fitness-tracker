function appendWorkoutWithLabel(file)
    addpath("ActivityFunctions");

    % Extract features
    steps = getTotalSteps(file);
    duration = getDuration(file);
    distance = getDistance(file);
    [avgAccel, maxAccel] = getAvgMaxAccel(file);
    altGain = getAltitudeGain(file);
    avgPace = (distance * 5280) / (duration * 60);

    % Create table
    workout = table(steps, duration, distance, avgPace, avgAccel, maxAccel, altGain, ...
        'VariableNames', {'steps','duration','distance','avgPace','avgAccel','maxAccel','altGain'});

    % Display and prompt for score
    disp("Workout Features:");
    disp(workout);
    intensity = input("➡️  Enter intensity score (0-10): ");
    workout.intensity = intensity;

    % Append to existing dataset
    if isfile('WorkoutData.mat')
        load('WorkoutData.mat', 'WorkoutData');
        WorkoutData = [WorkoutData; workout];
    else
        WorkoutData = workout;
    end

    save('WorkoutData.mat', 'WorkoutData');
    disp("Saved to WorkoutData.mat");
end