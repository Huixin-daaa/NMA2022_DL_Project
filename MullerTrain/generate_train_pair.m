function generate_train_pair(startpointl1,endpointl1,thetal1,startpointl2,endpointl2,thetal2,top_arrow_line, bottom_arrow_line,linewidth)
% startpoint : [x y]
% endpoint   : [x y]
% theta      : in radian angle between arrow and line
% arrowlen   : arrow length in pixel
figure();
hold on

% plot line1
plot([startpointl1(1) endpointl1(1)],[startpointl1(2) endpointl1(2)],'-k','linewidth',linewidth);
% plot arrow
theta1 = thetal1; %angle between arrow and line
theta2 = atan((endpointl1(1) - startpointl1(1))/((endpointl1(2) - startpointl1(2)))); %angle between line and axis y
plotarrow(startpointl1,top_arrow_line,theta1,theta2,linewidth);
theta2 = atan((startpointl1(1) - endpointl1(1))/((startpointl1(2) - endpointl1(2))));
plotarrow(endpointl1,top_arrow_line,theta1,theta2,linewidth);
xlim([0 256]);
ylim([0 256]);
hold on

% plot line2
plot([startpointl2(1) endpointl2(1)],[startpointl2(2) endpointl2(2)],'-k','linewidth',linewidth);
% plot arrow
theta1 = thetal2; %angle between arrow and line
theta2 = atan((endpointl2(1) - startpointl2(1))/((endpointl2(2) - startpointl2(2)))); %angle between line and axis y
plotarrow(startpointl2,bottom_arrow_line,theta1,theta2,linewidth);
theta2 = atan((startpointl2(1) - endpointl2(1))/((startpointl2(2) - endpointl2(2))));
plotarrow(endpointl2,bottom_arrow_line,theta1,theta2,linewidth);
xlim([0 256]);
ylim([0 256]);

axis off
set(gcf,'unit','pixel','position',[0 0 256 256]);
set(gca,'Position',[0,0,1,1]);
set(gcf,'PaperPositionMode','auto');
set(gcf,'Visible', 'off'); 
end