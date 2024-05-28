function generate_train(startpoint,endpoint,theta,arrowlen,linewidth)
% startpoint : [x y]
% endpoint   : [x y]
% theta      : in radian
% arrowlen   : arrow length in pixel
figure()
hold on
% plot line
plot([startpoint(1) endpoint(1)],[startpoint(2) endpoint(2)],'-k','linewidth',linewidth)
% plot arrow
theta1 = theta; %angle between arrow and line
theta2 = atan((endpoint(1)-startpoint(1))/((endpoint(2)-startpoint(2)))); %angle between line and axis y
plotarrow(startpoint,arrowlen,theta1,theta2,linewidth);

xlim([0 226])
ylim([0 226])

axis off
set(gcf,'unit','pixel','position',[0 0 226 226]);
set(gca,'Position',[0,0,1,1]);
set(gcf,'PaperPositionMode','auto')

end