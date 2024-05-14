% Bit plane slicing
% Update the program such that all the images from LSB to MSB get plotted in a single figure

a = imread('cameraman.tif');
a = double(a);
[row, col] = size(a);

% Preallocate a cell array to store bit planes
bit_planes = cell(1, 8);

for r = 1:8
    % Preallocate w size
    w = zeros(row, col);
    for x = 1:row
        for y = 1:col
            c = dec2bin(a(x, y), 8); % Convert decimal to binary
            d = c(r);
            w(x, y) = double(d);
            % Since w is a char and cannot be plotted
            if w(x, y) == 49
                % Since double of d will be either 49 or 48
                w(x, y) = 255;
            else
                w(x, y) = 0;
            end
        end
    end
    bit_planes{r} = w; % Store the bit plane
end


% Plotting all the images from LSB to MSB in a single figure
figure;
for r = 1:8
    if r == 1
    title('MSB');
    elseif r == 8 
        title('LSB');
    end
end 
    subplot(2, 4, r);
    imshow(uint8(bit_planes{r}));
    title(['Bit Plane ', num2str(r)]);

