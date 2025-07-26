function score = getRelativeIntensity(newWorkout, userHistory)
    fields = {'steps','duration','distance','avgPace','avgAccel','maxAccel','altGain'};

    if isempty(userHistory)
        score = 4;
        return;
    end

    mu = varfun(@mean, userHistory, 'InputVariables', fields);
    sigma = varfun(@std, userHistory, 'InputVariables', fields);
    sigma{1, sigma{1,:} == 0} = 1;

    z = (newWorkout{1, fields} - mu{1, :}) ./ sigma{1, :};

    % Only consider positive differences
    z(z < 0) = 0;

    % Weight features
    weights = [2.0, 2.0, 1.0, 1.0, 0.8, 0.8, 0.8];
    weightedZ = z .* weights;
    rawScore = norm(weightedZ);

    % Nonlinear scaling
    score = 10 * (1 - exp(-0.15 * rawScore));
    score = max(1, min(score, 10));
end