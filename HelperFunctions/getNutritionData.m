function nutritionData = getNutritionData(query)
    % Communicates with the nutritionix API to get the nutrition values of the foods put into the food tracker

    % Your Nutritionix credentials (burner)
    appId = '2c806a1e';
    appKey = '619763032a86981ff8e2596b8aa9b422';

    % API endpoint
    url = 'https://trackapi.nutritionix.com/v2/natural/nutrients';

    % Request headers as cell array
    headers = {
        'x-app-id', appId;
        'x-app-key', appKey;
        'Content-Type', 'application/json'
    };

    % Web options
    options = weboptions( ...
        'HeaderFields', headers, ...
        'MediaType', 'application/json', ...
        'RequestMethod', 'post');

    % Request body
    body.query = query;

    % Send POST request
    nutritionData = webwrite(url, body, options);
end