function nutritionData = getNutritionData(query)
    % Your Nutritionix credentials
    appId = '83faf221';
    appKey = '36fc54f295ad8cd7a28cdca58d970355';

    % API endpoint
    url = 'https://trackapi.nutritionix.com/v2/natural/nutrients';

    % Set request headers
    headers = {
        'x-app-id', appId;
        'x-app-key', appKey;
        'Content-Type', 'application/json'
    };
    
    % Set web options
    options = weboptions('HeaderFields', headers, 'MediaType', 'application/json', 'RequestMethod', 'post');

    % Request body
    body.query = query;

    % Send POST request
    nutritionData = webwrite(url, body, options);
end