function nuclei_counter(image)

% apply top hat and bottom hat filter
se = strel('disk',30);                      
tophat = imtophat(image,se);                
bottomhat = imbothat(image,se);             
hatFilter = (tophat - bottomhat);
filterImage = image + hatFilter;

% open image 
se2 = strel('disk',7);
afterOpening = imopen(filterImage,se2);


%and then detect edge using laplacian of gaussian
afterOpening = imadjust(afterOpening, [.01 .3], [0 1]);
lap = fspecial('laplacian', 1);
edges = imfilter(afterOpening, lap);
afterOpening = edges+afterOpening;
afterOpening = edges+afterOpening;
afterOpening = edges+afterOpening;
afterOpening = edges+afterOpening;
outputImage = afterOpening+20;
figure;imshow(outputImage);title('outputImage');

end