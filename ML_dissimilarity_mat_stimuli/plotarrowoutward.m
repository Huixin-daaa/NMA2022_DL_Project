function [] = plotarrowoutward(startpoint,arrowlen,theta1,theta2,linewidth)
vec1 = [arrowlen * cos(theta1) * sin(theta2)    arrowlen * cos(theta1) * cos(theta2)];
vec2 = [arrowlen * sin(theta1) * cos(-theta2)    arrowlen * sin(theta1) * sin(-theta2)];
% plot(vec1)
% startpoint =0 ;
pos1 = startpoint + vec1 + vec2;
pos2 = startpoint - vec1 + vec2;
pos3 = startpoint + vec1 - vec2;
pos4 = startpoint - vec1 - vec2;
plot([startpoint(1) pos1(1)],[startpoint(2) pos1(2)],'-k','linewidth',linewidth)
% plot([startpoint(1) pos2(1)],[startpoint(2) pos2(2)],'-k','linewidth',linewidth)
plot([startpoint(1) pos3(1)],[startpoint(2) pos3(2)],'-k','linewidth',linewidth)
% plot([startpoint(1) pos4(1)],[startpoint(2) pos4(2)],'-k','linewidth',linewidth)
end