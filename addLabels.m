function label = addLabels(data, i)
    if i == 1
        label = 'running';
    elseif i == 2
        label = 'walking';
    else
        label = 'standing';
    end
   
    label = repmat(label, size(data.Acceleration, 1), 1);
end