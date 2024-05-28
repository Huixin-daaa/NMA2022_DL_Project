%% generate the ML illusion images
line_width = 1;
image_len = 256;
label_cell = {};
line_length_list = 60:10:120; 
theta_list = 0.1:0.01:1.5;
arrow_len = 10;

%% outward
for n = 1:length(theta_list)
    for i = 1:length(line_length_list)
        y = image_len/2; 
        line_length = line_length_list(i);
        start_x = image_len/2 - line_length/2;
        stop_x = image_len/2 + line_length/2;
        theta = theta_list(n);
        generate_test([start_x, y],[stop_x, y],theta,arrow_len,line_width,1)
        saveas(gcf,"outward/outward_"+line_length+"_"+theta+".png");
    end
end
%% inward
for n = 1:length(theta_list)
    for i = 1:length(line_length_list)
        y = image_len/2; 
        line_length = line_length_list(i);
        start_x = image_len/2 - line_length/2;
        stop_x = image_len/2 + line_length/2;
        theta = theta_list(n);
        generate_test([start_x, y],[stop_x, y],theta,arrow_len,line_width,2)
        saveas(gcf,"inward/inward_"+line_length+"_"+theta+".png");
    end
end