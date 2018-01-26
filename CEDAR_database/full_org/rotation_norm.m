function Ibox = rotation_norm(image)
[m n] =size(image);
k =1;
for i = 1:m
    for j = 1:n
        if image(i,j) == 0
            points_x(k) = i;
            points_y(k) = j;
            k =k+1;
        end
    end
end
xbar = mean(points_x); ybar = mean(points_y);
x2bar = mean((points_x - xbar).^2); y2bar = mean((points_y - ybar).^2);
matrix = [x2bar xbar*ybar;xbar*ybar y2bar];
[vectors,values] = eig(matrix);
angle =  atan(vectors(2,2)/vectors(1,2));
rotmat = [cos(angle) -sin(angle) 0;sin(angle) cos(angle) 0;0 0 1];
for i = 1:length(points_x)
     newxy(:,i) = round(rotmat*[points_x(i);points_y(i);0]);
end
if min(newxy(1,:))<=0
    newxy(1,:) = newxy(1,:)+(-1*min(newxy(1,:)))+1;
end
if min(newxy(2,:))<=0
    newxy(2,:) = newxy(2,:)+(-1*min(newxy(2,:)))+1;
end
rotimage = ones(1000);
for i = 1:length(newxy)
    rotimage(newxy(1,i),newxy(2,i)) = 0;
end
Ibox = rotimage(min(newxy(1,:)):max(newxy(1,:)),min(newxy(2,:)):max(newxy(2,:)));
end