function removeFood(foodName)
    load("foodData.mat","foodData");    
    
    % Find and remove
    idx = find(strcmp({foodData.name}, foodName));
    if ~isempty(idx)
        foodData(idx) = [];
        save('foodData.mat', 'foodData');
    else
        disp('Food not found');
    end
end