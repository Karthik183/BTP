function [image1] = thresholding_me(image)
k = graythresh(image);
image1 = im2bw(image,k);
end
