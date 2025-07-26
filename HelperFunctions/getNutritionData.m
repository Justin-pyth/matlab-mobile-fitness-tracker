function nutritionData = getNutritionData(query)
    % Communicates with the nutritionix API to get the nutrition values of the foods put into the food tracker

    % Your Nutritionix credentials (burner)
    appId = '45ff7eb2';
    appKey = '9085d5e1a19d5ee49bc3ea6a1b2397a5';

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
