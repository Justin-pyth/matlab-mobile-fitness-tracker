function calories = calcMacros(protein, carbs, fat)
    % Calculates total calories and adds them to a counter based on the
    % given protein, fat, and carb data
    calories = (4 * protein) + (4 * carbs) + (7 * fat);
end