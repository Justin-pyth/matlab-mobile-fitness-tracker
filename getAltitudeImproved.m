function allAltitude = getAltitudeImproved()
    %This function retrieves Position.altitude from the Uphill, Downhill,
    %and Flat folders. 
    
    folderPaths = {"Data/Uphill", "Data/Downhill", "Data/Flat"};

    allAltitude = []; % Initialize an empty array to store all altitudes
    
    % Loop through each folder to grab all altitudes
    for i = 1:length(folderPaths)
        files = dir(fullfile(folderPaths{i}, '*.mat')); %Retrieve all files in folder
        for j = 1:length(files)
            data = load(fullfile(folderPaths{i}, files(j).name)); %Load file one at time
            label = createLabel(data, i, "Position"); % Calls user function to add labels
            data.Position.Activity = label; % Adds label to activity
            string(data.Position.Activity); %Kept getting an error
            data.Position.Activity = string(data.Position.Activity);
            allAltitude = [allAltitude; data.Position]; % Concatenate altitudes
            allAltitude.Activity = string(allAltitude.Activity);
        end
    end
end