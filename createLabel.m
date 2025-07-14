function label = createLabel(data, i)
    % This function adds a label to each activity 

    if i == 1
        label = 'running';
    elseif i == 2
        label = 'walking';
    else
        label = 'sitting';
    end
   
    label = repmat(label, size(data.Acceleration, 1), 1);
end