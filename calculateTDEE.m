function TDEE = calculateTDEE(data)
    %This function calculates TDEE (Total daily energy expenditure:represents the 
    % total number of calories your body burns in a 24-hour period)
    
    %Variables: weight (kg), height (cm), age (years), activityLvl (num) 

    % Calculate BMR based on gender
    if strcmp("Female", data.gender) %compare strings
        BMR = (10*data.weight) + (6.25*data.height) - (5*data.age) - 161; %female BMR
    else 
        BMR = (10*data.weight) + (6.25*data.height) - (5*data.age) + 5; %male BMR
    end
    
    % Determine Activity Level
    if strncmp('Sede', data.activityLvl, 4) %compares the first 4 characters
        activityLvl = 1.2; % Sedentary
    elseif strncmp('Ligh', data.activityLvl, 4)
        activityLvl = 1.375; % Lightly Active
    elseif strncmp('Mode', data.activityLvl, 4)
        activityLvl = 1.55; % Moderately Active
    elseif strncmp('Very', data.activityLvl, 4)
        activityLvl = 1.725; % Very Active
    elseif strncmp('Extr', data.activityLvl, 4)
        activityLvl = 1.9; % Extra Active
    end

    % Calculate TDEE by multiplying BMR with activity level
    TDEE = BMR * activityLvl;
end


