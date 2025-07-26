function removeFood(foodName)
    % Removes food from the foodData.m file

    % Load foodData.m to be edited
    load("foodData.mat","foodData");    
    
    % Find and remove food
    idx = find(strcmp({foodData.name}, foodName), 1);
    if ~isempty(idx)
        foodData(idx) = [];
        save('foodData.mat', 'foodData');
    else
        disp('Food not found');
    end
end