function label = createLabel(data, i, type)
    % This function adds a label to each activity 
    
    if type == "Acceleration"
        if i == 1
            label = 'running';
        elseif i == 2
            label = 'walking';
        else
            label = 'sitting';
        end
        label = repmat(label, size(data.Acceleration, 1), 1);
    elseif type == "Position"
        if i == 1
            label = 'uphill';
        elseif i == 2
            label = 'downhill';
        else
            label = 'flat';
        end
        label = repmat(label, size(data.Position, 1), 1);
    end
end