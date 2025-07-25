function allAccelerations = getAllAccelerations()
    % This function collects all the acceleration logs from files
    % within the Running, Walking, and Sitting folders and stores
    % them into allAcclerations

    folderPaths = {"Data/Running", "Data/Walking", "Data/Sitting"};

    allAccelerations = []; % Initialize an empty array to store all accelerations
    
    % Loop through each folder to grab all accelerations
    for i = 1:length(folderPaths)
        files = dir(fullfile(folderPaths{i}, '*.mat')); %Retrieve all files in folder
        for j = 1:length(files)
            data = load(fullfile(folderPaths{i}, files(j).name)); %Load file one at time
            label = createLabel(data, i, "Acceleration"); % Calls user function to add labels
            data.Acceleration.Activity = label; % Adds label to activity
            allAccelerations = [allAccelerations; data.Acceleration]; % Concatenate accelerations
        end
    end
end
