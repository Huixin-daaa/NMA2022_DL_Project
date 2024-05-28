function generate_test(startpoint,endpoint,theta,arrowlen,linewidth,tail)
% startpoint : [x y]
% endpoint   : [x y]
% theta      : in radian angle between arrow and line
% arrowlen   : arrow length in pixel
% tail       : 1 = outward, 2 = inward
figure();
hold on

if tail == 1
% plot line
plot([startpoint(1) endpoint(1)],[startpoint(2) endpoint(2)],'-k','linewidth',linewidth);
% plot arrow
theta1 = theta; %angle between arrow and line
theta2 = atan((endpoint(1) - startpoint(1))/((endpoint(2) - startpoint(2)))); %angle between line and axis y
plotarrowoutward(startpoint,arrowlen,theta1,theta2,linewidth);
theta2 = atan((startpoint(1) - endpoint(1))/((startpoint(2) - endpoint(2))));
plotarrowoutward(endpoint,arrowlen,theta1,theta2,linewidth);
xlim([0 256]);
ylim([0 256]);
else
% plot line
plot([startpoint(1) endpoint(1)],[startpoint(2) endpoint(2)],'-k','linewidth',linewidth);
% plot arrow
theta1 = theta; %angle between arrow and line
theta2 = atan((endpoint(1) - startpoint(1))/((endpoint(2) - startpoint(2)))); %angle between line and axis y
plotarrowinward(startpoint,arrowlen,theta1,theta2,linewidth);
theta2 = atan((startpoint(1) - endpoint(1))/((startpoint(2) - endpoint(2))));
plotarrowinward(endpoint,arrowlen,theta1,theta2,linewidth);
xlim([0 256]);
ylim([0 256]);
end

axis off
set(gcf,'unit','pixel','position',[0 0 256 256]);
set(gca,'Position',[0,0,1,1]);
set(gcf,'PaperPositionMode','auto');
set(gcf,'Visible', 'off'); 