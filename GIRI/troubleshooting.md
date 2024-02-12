# Troubleshooting grinds
#### Shutter speeds and program wait times
There are a number of hardcoded wait times (and pauses) in the code. This means that if you increase shutter speeds beyond the length of the wait times, you may run into unexpected errors during your run. These crop up during the checking of thumbnail images and (likely) in verifying images. A great item for the to-do list would be to un-hard code these wait times, and instead use the longest shutter speed + a buffer. (Long shutter speeds are useful for UV -- I (Julia) have been using 20s, but I think 25s looks even better for a lot of images.)  

**Waiting times in the grind code**
1. ```verify_ims_exif``` line 42: ```pause(15);```
   - This pause comes after raw images have been captured (we see the message "Done with the image sequence, now generating thumbnails.") and before we generate thumbnails. Increasing pause time *might* mean that the program has to do fewer checks for images. It depends if the images have been completely captured by the time the pause comes, or if the command to capture has been sent but the images are not yet received. (I.e. if the longest shutter speed is 20s, the 15s pause would not be long enough to see that image come in.)
   - I have left the pause at 15 and things have been okay, even though my longest shutter speed is 20s.
2. ```image_capture``` line 15: ```[proceed, message] = wait_for_image(45);```
   - Here we *definitely* waiting for the image, and the time (45s) must be longer than the longest shutter speed.

**Issues verifying images**
There are some hard-coded thresholds that are used to check that image i+1 is sufficiently similar to image i, which is a proxy for everything working as planned. However, some rocks have enough variability at the 20 micron scale (i.e. the grinding interval) that I have found these thresholds to be *too restrictive*. Each time thresholds are not met, the grind stops, the user receives a text, and must come in to re-start the machine.  

If you have to re-start after receiving a text that says: "Please come in! ... Error message is: Images Not Verified." Here is what you should do:  

1. (Optional, but helpful): **Check which threshold / wavelength failed**
   - Manually run the parts of ```verify_ims_exif``` that check the thresholds:
     - line 137: set ```raw_listing``` to the path where your files are:
       - ```raw_listing = dir();```
     - also run line 140: ```[~,sorted_idx] = sort([raw_listing.datenum]);```
     - Highlight lines 149-169 (```comp_status = zeros(...)``` through the end of the ```for``` loop and run it in the command line. Once it runs, check the variable ```comp_status``` to see which image(s) triggered the threshold failure(s). (It will look like [1,0,0,1,1], which would mean that the 2nd and 3rd wavelengths triggered the failure.
        - Then you can just run the interior of the for loop for the image(s) that failed. Set ```i =``` whichever image you want to explore. Comment out line 169 (```comp_status(i) = thumbnail_comparison(...)```). Uncomment line 170 (```[x_status, x_simi,...] = thumbnail_comparison(...)```. Highlight the interior of the for loop and run it in the command line. Check the variables:
           - ```x_status```: 0 or 1 (fail, true)
           - ```x_simi```: structural similarity
           - ```x_exp_pct_diff```: exposure percent difference
           - ```x_top_mean```: top values of difference image
           - (you can look at all the details in ```thumbnail_comparison.m```)
         - If any of them are larger than the thresholds (input variables into ```thumbnail_comparison``` on line 169, this is why your grind failed).
         - Manually check your images! If somethign truly has failed, address that problem [not covered here].
         - If all the images look okay, just lower the thresholds and re-start your run [see below]
   - When you **re-start** your run, the grinder will still think that the run is happening. This is okay. You will re-run ```barebones_serial``` and start a "new" grind as usual. **HOWEVER** you will need to decrease the number of grinds to whatever the grinder computer thinks is happening (top of your script, number of times the loops are called) *minus* the number of grinds that have already happened. You can easily figure out how many have happened either by checking the output in the command window (the last line that says "Grind number X is under way.") or by looking at how many images have been taken (in finder, select all the photos from this grind and divide by the number of wavelengths). (So just tell the barebones_serial prompt that there are fewer grinds than the grinder thinks there are.)
