set(0,'DefaultFigureWindowStyle','docked')
nx = 100;
ny = 100; 
ni = 200;
V = zeros(nx,ny);
V(1,:) = 0;
V(ny,:) = 0;
V(:,1) = 1;
V(:,nx) = 1;
 
SideToZero = 1;
for i = 1:ni
    for i = 2:nx-1
        for j = 2:ny-1
        V(i,j) = (V(i+1,j)+V(i-1,j)+V(i,j+1)+V(i,j-1))/4;
        end
        if mod(i,50) == 0
            pause(0.05)
        end 
    end
end
 
figure(1)
surf(V)
    
figure (2)
[Ex, Ey] = gradient(V);
 quiver(Ex, Ey)
    
figure(3)
surf(imboxfilt(V,3))
pause(0.05)
