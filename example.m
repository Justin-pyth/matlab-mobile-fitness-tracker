subplot(2,2,1)
pie([20, 40, 40], {'Sitting', 'Walking', 'Running'})
title('Time Breakdown')

subplot(2,2,2)
axis off
text(0, 0.5, 'Total Calories: 500 kcal', 'FontSize', 12)
text(0, 0.3, 'Thats about 7 cokes', 'FontSize', 12)
text(0, 0.1, 'Or 2 bigmacs', 'FontSize', 12)

% Show image of burger
subplot(2,2,3)
burgerImg = imread('img/coke.jpg');
imshow(burgerImg)
title('1 coke ≈ 480 kcal')

% Show image of Oreo
subplot(2,2,4)
oreoImg = imread('img/bigmac.jpg');
imshow(oreoImg)
title('1 bigmac ≈ 53 kcal')
