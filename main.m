close all;
clear;

%read
sns = imread('CW-images\StackNinja1.bmp');

%remove blue and red colour
sns(:, :, 1) = 0;
sns(:, :, 3) = 0;

%sharpen
snss = imsharpen(sns);

%contrast
snssa = imadjust(snss,[.01 .6], [0 1]);

%grayscale
snssag = rgb2gray(snssa);

%remove noise
snssagf = medfilt2(snssag);

%function
nuclei_counter(snssagf);