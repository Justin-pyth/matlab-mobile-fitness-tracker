function dataStruct = getData(folder)
    
    % Get list of all .mat files in the folder
    fileList = dir(fullfile(folderPath, '*.mat'));
    
    % Initialize output structure
    dataStruct = struct('filename', {}, 'data', {});
    
    % Loop through files
    for k = 1:length(fileList)
        fileName = fileList(k).name;
        fullFilePath = fullfile(folderPath, fileName);
        
        % Load file
        fileData = load(fullFilePath);
        
        % Store in output structure
        dataStruct(k).filename = fileName;
        dataStruct(k).data = fileData;
    end
end
