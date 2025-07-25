function score = getRelativeIntensity(newWorkout, userHistory)
    fields = {'steps','duration','distance','avgPace','avgAccel','maxAccel','altGain'};
    mu = varfun(@mean, userHistory, 'InputVariables', fields);
    sigma = varfun(@std, userHistory, 'InputVariables', fields);
    
    z = (newWorkout{1, fields} - mu{1, :}) ./ sigma{1, :};
    z(isnan(z)) = 0;  % handle divide-by-zero
    score = norm(z);  % Euclidean distance
    score = min(score, 10);
end