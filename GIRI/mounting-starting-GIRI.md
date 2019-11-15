# Turning on Machine, mounting sample, starting grind on newly mounted sample:

- Turn on machine switch on front of machine. If air is coming out of valve on the right of the machine (loud hissing noise), place a finger over the valve. The hissing should stop. Turn on the camera. Turn on the stage lights.

- On the onboard computer, select “jog” and the “10x” handle command. Move table to the left using the z-axis wheel. Then select “auto” within the jog menu for the machine to recenter itself.

- Go back to the main menu and select “G code.” Using the 10x and 1x toggles on the computer, bring the table to -1.00 in machine coordinates. After, make sure to deselect the 10x or 1x toggle so that the table does not move.

- Rub some oil on the machine chuck and on the bottom of the sample plate. Place the sample on the chuck in a position you think would be in the camera field of view. Do not engage the magnet yet.

- We now want to set the starting point in the y-axis (up and down) such that the wheel starts just above the highest point of the sample to avoid having to do hundreds of grind sequences before making contact with the sample. First, 0-set the relative coordinates with the current position of the table with the sample approximately under the camera. This can be done by selecting “pos” and within that menu select “all” and “0 set.” Close this menu.

- Then, using the 10x and 1x toggles on the computer, move the table down (y-axis) so the sample is well below the wheel. Move the table left-right, forward-back (z and x-axis) until the highest point of the sample is under the lowest point of the wheel. Then move the table up (y-axis) until there is less than a millimeter of space between the wheel and the highest point of the sample. Do so slowly and carefully, as a collision between the wheel and the sample may damage or even shatter the wheel. Once this is done, bring the table back to 0.00 in x and z in the relative coordinate space. Ensure the movement toggles are off. 0-set these coordinates once again to account for the new y-axis start position.

- To ensure the sample is under the camera, first open the camera shutter. This command is under “FUNC1.” In the “others” group, it is the “MAG” button.

- On the control room computer within the shutter control program. In here make sure the camera is synced and open the cameral aperture. Now, in Capture One 10 (not capture One 11, and you may need to restart the computer when switching between version 10 and 11 to get the camera to communicate with the program), select the live view (the button that looks like a video camera). The feed should show the view from the camera. Then gently slide the sample plate around on the chuck until the desired portion of the sample is within the camera’s field of view.

- Now engage the magnet by flipping the lever to the right and close the shutter using the same command that you used to open it.

- Tie an unused garbage bag (usually in the bottom of one of the trash cans) over the top of the camera dry bag to keep debris and coolant from getting to the camera.

- Now set the starting position and the width of the sample in the x-axis (forward to backward when looking at the machine). To do this, move the table in the x-axis until the wheel is just to the left of the edge of the sample when looking down the z-axis (it is best to leave a few millimeters of space just to be sure the entire sample will be ground). This is the position where the wheel will start a grind before moving across the sample. Set this position to x = 0 in relative coordinates (“pos” -> “relative” -> by x select “reset” and type in 0). You now need to put the sample width into the G code. You can figure out sample width by moving the table on the x-axis until the wheel is to the right of the sample when looking down the z-axis. The absolute value of x in relative coordinate space is the width of your sample. You can add a few tenths of an inch just to be safe. To put this into the G code, find the line that reads  “G91G01X_._F150.  /* Move across sample…” Your sample width in inches with one decimal place will go in the blank after X (using G code from a previous sample, the blanks will be populated with the width of the previous sample).  Move the table along the x axis back to 0 in relative coordinates. Be sure to then turn off the x10 or x1 movement toggle.

- You must also perform Left and Right teaching so the machine knows the length of the sample in the z-axis. To do this, move the table along the z axis until the sample is to the left of the wheel. Go far enough so that the sample is entirely to the left of the lowest point of the wheel and leave a couple of inches to be safe. In this position, hit “L teach” on the screen. Then move the sample to the right of the wheel and hit “R teach.” When this is done, move the sample back to z=-1.000 in machine coordinates.

- Now save the G code file. Select save near the top of the screen. Rename the file in the format “samplename.startdate” and save it.

- You are now ready to start the grind. Be sure to check coolant amount and chemistry metrics. Put the correct number of loops in the G code (third line “M98P1000L___” with number of loops coming after L) and press the machine start.
