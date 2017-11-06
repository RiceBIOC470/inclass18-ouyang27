% In class 18

% Problem 1. In this directory, you will find the same image of yeast cells as you used
% in homework 5. First preprocess the image any way you like - smoothing, edge detection, etc. 
% Then, try to find as many of the cells as you can using the
% imfindcircles routine with appropriate parameters. 
% Display the image with the circles drawn on it.  
img = imread('yeast.tif');
hx = fspecial('sobel');
hy = hx';
Iy = imfilter(double(img),hy,'replicate');
Ix = imfilter(double(img),hx, 'replicate');
edge_img = sqrt(Ix.^2+Iy.^2);
[centers, radii] = imfindcircles(edge_img,[15 25],'Sensitivity', 0.96);
figure; imshow(img,[]);hold on;
for ii = 1:length(centers)
    drawcircle(centers(ii,:),radii(ii),'m');
end
 
% Problem 2. (A) Draw two sets of 10 random numbers - one from the integers
% between 1 and 9 and the second from the integers between 1 and 10. Run a
% ttest to see if these are significantly different. (B) Repeat this a few
% times with different sets of random numbers to see if you get the same
% result. (C) Repeat (A) and (B) but this time use 100 numbers in each set
% and then 1000 numbers in each set. Comment on the results. 
%%
x = randi(9,1,10);
y = randi(10,1,10);
zz = ttest2(x,y);
% Yu Ouyang: Mostly, the result zz = 0, which means the x and y have the 
% same mean. There are chances to get zz = 1 to recognize xand y with 
% different means. 
%%
x = randi(9,1,100);
y = randi(10,1,100);
zz = ttest2(x,y);

x = randi(9,1,1000);
y = randi(10,1,1000);
zz = ttest2(x,y);

% Yu Ouyang: When increasing the sample size, chances are more to get the
% result zz = 1, i.e. x and y have different means. Therefore, it suggests
% that one way to check the slight difference between two samples is to
% increase the sample size. 
