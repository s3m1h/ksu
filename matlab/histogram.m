% histogram
% matlabin içinde olan gri seviye bir görüntü
% pout = imread("pout.tif"); 
function h = histogram(I)
    [m,n] = size(I);
    h = zeros(1,256);
    for k = 0:255
        for i = 1:m
            for j = 1:n
                if I(i,j) == k
                    h(k+1) = h(k+1) +1;
                end
            end
        end
    end

bar(0:255,h)
end