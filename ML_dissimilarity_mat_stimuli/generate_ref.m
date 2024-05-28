%% generate the reference images
line_width = 1;
image_len = 256;
label_cell = {};
line_length = 100;
theta_list = 0.1:0.01:1.5;

for n = 1:length(theta_list)
    y = image_len/2; 
    start_x = image_len/2 - line_length/2;
    stop_x = image_len/2 + line_length/2;
    theta = theta_list(n);
    arrow_len = 10;
    generate_train([start_x, y],[stop_x, y],theta,arrow_len,line_width)
    saveas(gcf,"ref/ref_"+line_length+"_"+theta+".png");
end
