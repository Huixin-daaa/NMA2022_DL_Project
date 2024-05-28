% create a set of train images
batch_size = 500;
line_width = 1;
image_len = 256;
label_cell = {};

for n = 10400:10500
    sign = randi([1,2],1);
    % 96~192
    if sign == 1
        top_length = randi([98,192],1);
        uplimit = min([top_length-96, 62]);
        bottom_length = top_length - randi([2,uplimit],1);  
    else
        top_length = randi([96,190],1);
        uplimit = max([192-top_length,62]);
        bottom_length = top_length - (-1) * randi([2,62],1);
    end

    if top_length > bottom_length
        label = 'L';
    else
        label = 'S';
    end
    label_cell(end+1) = {label};

    top_y = randi([image_len-108,image_len-48],1); % 48~108 pixel to the top 
    top_start_x = image_len/2 - top_length/2;
    top_stop_x = image_len/2 + top_length/2;
    top_theta = pi*(1/18+rand(1)*(0.5-1/18));
    top_arrow_line = (15+rand(1)*(40-15))*0.8;

    bottom_y = 256;
    while bottom_y > top_y
        bottom_y = randi([image_len-208,image_len-148],1); % 148~208 pixel to the top 
    end
    bottom_start_x = image_len/2 - bottom_length/2;
    bottom_stop_x = image_len/2 + bottom_length/2;
    bottom_theta = pi*(1/18+rand(1)*(0.5-1/18));
    bottom_arrow_line = (15+rand(1)*(40-15))*0.8;

    generate_train_pair([top_start_x, top_y],[top_stop_x, top_y],top_theta, ...
                        [bottom_start_x,bottom_y], [bottom_stop_x,bottom_y], ...
                        bottom_theta, top_arrow_line, bottom_arrow_line, line_width);

    if label == "L"
        saveas(gcf,"train_image_L/train_"+n+".png");
    else
        saveas(gcf,"train_image_S/train_"+n+".png");
    end
    clf;
end

label_cell = reshape(label_cell,length(label_cell),1);
%writecell(label_cell,'label.csv')