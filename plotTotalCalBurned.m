function plotTotalCalBurned(totalCalBurned, yfitcat)
    % This function creates a visual summary of your workout. It shows how 
    % much time you spent walking, running, and sitting, calculates total 
    % calories burned, and compares that to fun food equivalents like Cokes 
    % and Big Macs — with images for easy understanding.

    % Create food equivalents 
    cokeCal = 140; %kcal
    bigMacCal = 563; %kcal

    % Calculate for number of items 
    numOfCokes = (totalCalBurned / cokeCal);
    numOfBigMac = (totalCalBurned / bigMacCal);

    %% Plot the visuals
    subplot(2,2,1)
    pie(yfitcat);
    title('Activity Breakdown')
    
    subplot(2,2,2)
    axis off
    text(0, 0.5, sprintf('Total Calories: %.1f kcals', totalCalBurned), 'FontSize', 12)
    text(0, 0.3, sprintf('Thats about %.1f cokes', numOfCokes), 'FontSize', 12)
    text(0, 0.1, sprintf('Or %.1f big macs', numOfBigMac), 'FontSize', 12)
    
    % Show image of coke
    subplot(2,2,3)
    cokeImg = imread('img/coke.jpg');
    imshow(cokeImg)
    title('1 coke ≈ 140 kcal')
    
    % Show image of big mac
    subplot(2,2,4)
    bigMacImg = imread('img/bigmac.jpg');
    imshow(bigMacImg)
    title('1 bigmac ≈ 563 kcal')
end
