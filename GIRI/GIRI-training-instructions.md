# Giri Training Instructions
Training has two phases. The first is making training data, second train a neural network 

### In Photoshop
1. Open Photoshop
2. Open image
3. Create new layer--one for each class
4. Using the magnet tool, trace an object then use the bucket tool to fill (try to stick with primary colors if possible)
5. When finished tracing, select the layer on the bottom right panel
and click on one of the traced elements from that layer with the
magic wand. Then delete the layer and fill it again with the same
color. This gets rid of the gradient at the edge of the image. (check
the anti-aliasing box on the top toolbar). Repeat for each layer.
6. If you are training half-size images, then click on Image --> Image Size --> decrease the height and width of the image by 50% 
7.  Go to Image --> Mode --> 8 bits/channel
8.  Select all layers except for the layer containing the original image (often labelled background). 
9.  Go to Image --> Mode --> Indexed Color. It will ask if you want to merge layers, select "OK"
10. Save as tif. Make sure the background is deleted and only the training mask is present.

### In MATLAB
- Use train_with_multiple.m script
- more to come on this section. 
