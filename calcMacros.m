function calories = calcMacros(foodData)
    %Calculates total calories and adds them to a counter based on the
    %given protein, fat, and carb data
    calories = (4 * foodData.protein) + (4 * foodData.carbohydrates) + (foodData.fat * 7);

end