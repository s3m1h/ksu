f = imread("rose2.tif")

% whos ile f hakkında size, byte vs. bilgi alıyorsun
% whos f

% imshow(f) % görüntüyü bir pencere ile göstermek için
% imwrite(f,"filename") % f görüntüsünü başka bir isimle kaydetme

% dosya ile ilgili bilgileri veriyor.
% imfinfo filename.jpg

% ikinci bir görüntüleme için figure
imshow("rose.png"),figure, imshow(f)

% imtool ile görüntü görüntüleme
% imtool(f)

% görüntüleri yazma
imwrite(f,"filename")

% jpeg görüntülerde kalite için q değeri - 50 [0..100]
imwrite(f,"rose3.jpg","quality",50)

% jpeg sıkıştırma oranını bulan kod
K = imfinfo("rose3.jpg")
image_bytes = K.Width * K.Height * K.BitDepth/8;
compressed_bytes = K.FileSize
compression_ratio = image_bytes/compressed_bytes

% tif görüntüler ve dpi
imwrite(f,"rose.tif",compression,"none","resolution",[300 300])



