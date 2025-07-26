function addFood(foodName, protein, fats, carbs, servingSize)
    % Adds a food item to the foodData.m file
    
    % Loading foodData file to be updated
    load("foodData.mat","foodData");
    
    % Creating struct for new food
    newFood = struct( ...
        'name', foodName, ...
        'protein', protein, ...
        'fat', fats, ...
        'carbohydrates', carbs, ...
        'servingGrams', servingSize);
                
    % Adding food onto foodData.m
    foodData(end+1) = newFood;
    save('foodData.mat', 'foodData');
end