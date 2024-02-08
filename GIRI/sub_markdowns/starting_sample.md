## Mounting a new sample for serial grinding and imaging

1) Turn on machine switch on front of machine. If air is coming out of the valve on the right of the machine (loud hissing noise), place a finger over the valve. The hissing should stop. 

2) Turn on the camera. 

3) On the onboard computer, select “jog” and the “10x” handle command. Move table to the left using the z-axis wheel, such that most of the magnetic chuck is to the left of the wheel. Then select “auto” within the jog menu for the machine to recenter itself. We move the table to the left prior to auto-centering the positions because if the table is too far to the right, it may jog itself past its limit and throw an error.

4) On the onboard computer, go back to the main menu and select “G code.” Using the 10x and 1x toggles on the computer, bring the table z-axis (left and right) near -1.00000 in machine coordinates. After, make sure to deselect the 10x or 1x toggle so that the table does not move. We want the table around this position because that is where the grinder moves to image in the grinding and imaging protocols. No need to be very exact for now, this step can just help give you a rough guide for initially placing the sample.

5) If you have not yet, now is a good time to use the fine honing stone and [3-IN-ONE oil](https://www.grainger.com/product/3-IN-ONE-Machine-Oil-Multipurpose-Oil-4UJ34) to polish the chuck. Use a figure 8 pattern to move back and forth on the chuck. 5 passes each way should be enough.

6) Rub some [3-IN-ONE](https://www.grainger.com/product/3-IN-ONE-Machine-Oil-Multipurpose-Oil-4UJ34) oil on the machine chuck and on the bottom of the sample plate. Place the sample on the chuck in a position you think would be in the camera field of view, directly below the lens. Do not engage the magnet yet.

7) We now want to set the starting point in the y-axis (up and down) such that the wheel starts just above the highest point of the sample to avoid having to do hundreds of grind sequences before making contact with the sample. Then, using the 10x and 1x toggles on the computer, move the table down (y-axis) so the sample is well below the wheel. Move the table left-right, forward-back (z and x-axis) until the highest point of the sample is under the lowest point of the wheel. Then move the table up (y-axis) until there is less than a millimeter of space between the wheel and the highest point of the sample. Do so slowly and carefully, as a collision between the wheel and the sample may damage or even shatter the wheel. Once the wheel is close to the sample, bring the table z-axis back to exactly -1.00000 machine coordinates. Ensure the movement toggles are off. 

8) We use the imaging position (which is where the table currently is positioned) as the relative 0 in the G code for grinding and imaging. Set this position as the 0 now by selecting “pos” and within that menu select “all” and “0 set.” Close this menu.

9) Now we’ll make sure the sample is well-positioned in the field of view. This step requires the live feed, so if the mechanical shutter is in front of the lens, open it from the onboard computer main G code menu by selecting “FUNC1.” In that menu, under the “others” group, it is the “MAG” button.

10) On the control iMac, in Capture One (whichever version is current, shouldn’t matter), select the live view (the button that looks like a video camera). The feed should show the view from the camera. Gently slide the sample plate around on the chuck until the desired portion of the sample is within the camera’s field of view. Sometimes I turn the iMac around so I can see the feed while positioning the sample.

11) Once the sample is well-positioned, engage the magnetic chuck by flipping the lever to the right and close the shutter using the same command that you used to open it.

12) **Update this section once housing is finalized for new setup with ring light**

13) Time to set the starting position and the width of the sample in the x-axis (forward to backward when looking at the machine). Move the table in the x-axis until the wheel is just in front of the front edge of the sample (when standing at the front of the machine where x-axis movements are forward-backward). Sometimes it is easiest to verify this position standing near the onboard computer, looking down the z-axis. It is best to leave a few millimeters of space just to be sure the entire sample will be ground. This position is where the wheel will start a grind before moving across the sample, so extra space in this direction just adds to the time-per-grind. Not a huge deal to have extra, but don’t go crazy. Set this position to x = 0 in relative coordinates (“pos” -> “relative” -> by x select “reset” and type in 0). 

14) Enter the sample width into the G code. You can figure out sample width by moving the table on the x-axis until the wheel is behind the back edge of the sample when standing at the front of the machine. The absolute value of x in relative coordinate space is the width of your sample. You can add a few tenths of an inch just to be safe. In this case, don’t add more than a couple of tenths because superfluous movement in this direction will add time between the sample finishing grinding and moving to the roller and imaging, increasing the risk of drying before imaging. To put the sample width into the G code, find the line that reads “G91G01X_._F150. /* Move across sample…” Your sample width in inches with one decimal place will go in the blanks after X (using G code from a previous sample, the blanks will be populated with the width of the previous sample). Move the table along the x axis back to 0 in relative coordinates. Be sure to then turn off the x10 or x1 movement toggle.

15) Save the G code file. Select save near the top of the screen. Rename the file in the format “samplename.startdate” and save it. It can help to plug a keyboard into one of the usb slots on the computer to make typing easier.

16) The final step is Left and Right teaching so the machine knows which coordinates to move between on the z-axis when passing over the sample to grind it.. To do this, move the table along the z axis until the entire sample is to the left of the lowest spot on the wheel. An extra inch or so is a good idea. When you are at a good left-most position, hit “L teach” on the screen. Then move the entire sample to the right of the lowest part of the wheel, again leaving an extra inch or so, and hit “R teach.” When this is done, move the sample back to z=-1.000 in machine coordinates (should be 0 in relative coordinates).

17) You are now ready to start grinding. You can follow the next section: ‘[Daily operations to grind and image a sample](daily_operations.md)’ to get going.
  
