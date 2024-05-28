% create a set of test images
line_width = 1;
image_len  = 256;
label_cell = {};
cmp_list   = linspace(standard-20,standard+20,5);
cmp_list   = repmat(cmp_list,[1,100]);
cmp_list   = Shuffle(cmp_list);
standard   = 100; % neutral line segment length
[top_theta,bottom_theta] = deal(pi/4);
for n = 1 : size(cmp_list,2)

    top_length = cmp_list(n);
    bot_length = standard;

    top_y = randi([image_len-108,image_len-48],1); % 48~108 pixel to the top 
    top_start_x = image_len/2 - top_length/2;
    top_stop_x = image_len/2 + top_length/2;
%     top_theta = pi*(1/18+rand(1)*(0.5-1/18));
    top_arrow_line = (15+rand(1)*(40-15))*0.8;

    bottom_y = 256;
    while bottom_y > top_y
        bottom_y = randi([image_len-208,image_len-148],1); % 148~208 pixel to the top 
    end
    bottom_start_x = image_len/2 - standard/2;
    bottom_stop_x = image_len/2 + standard/2;
%     bottom_theta = pi*(1/18+rand(1)*(0.5-1/18));
    bottom_arrow_line = (15+rand(1)*(40-15))*0.8;

    generate_train_pair([top_start_x, top_y],[top_stop_x, top_y],top_theta, ...
                        [bottom_start_x,bottom_y], [bottom_stop_x,bottom_y], ...
                        bottom_theta, top_arrow_line, bottom_arrow_line, line_width);

                    
    %create directory
    if ~exist('test_image')
        mkdir('test_image');
    end
                    
                  
    saveas(gcf,"test_image/test_image"+n+".png");
  
    clf;
    length_list(n,1) = top_length;
    length_list(n,2) = bot_length;
end

csvwrite('length.csv',length_list)