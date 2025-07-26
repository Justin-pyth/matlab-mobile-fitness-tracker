function updateUserHistory(workout, userID)
    % Updates the user's history of workouts
    
    folder = 'UserData';
    if ~exist(folder, 'dir')
        mkdir(folder);
    end
    historyFile = fullfile(folder, sprintf('user_%s_history.mat', userID));
    
    if isfile(historyFile)
        load(historyFile, 'userHistory');
        userHistory = [userHistory; workout];
    else
        userHistory = workout;
    end
    
    save(historyFile, 'userHistory');
end