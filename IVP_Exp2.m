% Its just the continuation of EXP 1
I = imread("pout.jpg");
J = histeq(I);
subplot(221), imshow(I);
title('original image ');
subplot(222), imhist(I);
title(' histogram');
subplot(223), imshow(J);
title('equalized image ');
subplot(224), imhist(J);
title('equalized histogram');