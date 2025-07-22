function nutritionData = getNutritionData(query)
    % Your Nutritionix credentials
    appId = '83faf221';
    appKey = 'b130a736abb0a8c0988ff5e1f709951f';

    % API endpoint
    url = 'https://trackapi.nutritionix.com/v2/natural/nutrients';

    % Set request headers
    headers = [
        http_createHeader('x-app-id', appId)
        http_createHeader('x-app-key', appKey)
        http_createHeader('Content-Type', 'application/json')
    ];

    % Set web options
    options = weboptions('HeaderFields', headers, 'MediaType', 'application/json', 'RequestMethod', 'post');

    % Request body
    body.query = query;

    % Send POST request
    nutritionData = webwrite(url, body, options);
end
