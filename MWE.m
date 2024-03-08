% here is a minimal example
x = 0:pi/100:2*pi;
y1 = sin(x);
y2 = sin(x-0.25);
y3 = sin(x-0.5);

figure
plot(x,y1,x,y2,'--',x,y3,':');
figaxes = gca;

% Use the function to shift the axis to the origin
newFigHandle = shiftAxisToOrigin(figaxes);
