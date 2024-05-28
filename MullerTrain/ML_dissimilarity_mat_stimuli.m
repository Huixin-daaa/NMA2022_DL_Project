%% generate the reference image
line_width = 1;
image_len = 256;
label_cell = {};
line_length = 100;
theta_list = [pi/6,pi/5,pi/4,pi/3];

for n = 1:length(theta_list)
    y = image_len/2; 
    start_x = image_len/2 - line_length/2;
    stop_x = image_len/2 + line_length/2;
    theta = theta_list(n);
    arrow_len = 10;
    generate_train([start_x, y],[stop_x, y],theta,arrow_len,line_width)
    saveas(gcf,"ref_"+line_length+"_"+theta+".png");
end
