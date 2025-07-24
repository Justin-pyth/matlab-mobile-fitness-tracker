function nutritionData = getNutritionData(query)
    % Your Nutritionix credentials
    loadenv("Credentials.env");
    appId = getenv("NUTRITIONIX_ID");
    appKey = getenv("NUTRITIONIX_KEY");

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