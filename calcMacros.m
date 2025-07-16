function calories = calcMacros(foodData)
    %Calculates total calories and adds them to a counter based on the
    %given protein, fat, and carb data
    clear;
    calories = 4 * (foodData.protein + foodData.carbohydrates) + foodData.fat* 7;

end