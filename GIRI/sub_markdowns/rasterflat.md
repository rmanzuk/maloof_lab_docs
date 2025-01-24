# A COMPLETE GUIDE TO FLATTENING SAMPLES
## 0. Preparing your samples.
Are your samples...  
- [ ] Glued?
- [ ] Documented in the notebook?  
    page: ____  
- [ ] Photographed on the Nikon?    
    photo number: ______  
- [ ] Polished on in the lapidary so that they are mostly flat?

**If all four of these steps are complete, you are ready to get the grinder set up.**

## 1. Pre-grinding preparation.
**Polish**  
- [ ] Polish steel plates:
    - Apply a drop of **sharpening stone oil** (white cap) to the steel.
    - Using the **red stone**, polish in a figure 8 pattern until the stone passes smoothly over the steel.
    - Apply a few drops of 3-in-1 oil to the steel. 
    - Finish polishing with 10 figure-8s of the gray stone.
- [ ] Polish the chuck with the tan stone and 3-in-1 oil. Leave oil on the chuck.
**Check oil and coolant levels**  
- [ ] Check coolant levels. If less than 6", mix more coolant (see section 1.a. below.)
    -[ ] (Add coolant if needed)
- [ ] Expose new filter paper (on the roll)
- [ ] Check the back of the machine to see if leaked oil is close to filling up the overflow tub.  
    - If it is, pour waste oil into the waste container  
- [ ] Check lubricant levels on the front of the grinder. Refill with **Mobil Vactra** (blue container, in the cabinet).
**Turn the grinder/wheel on**
- [ ] Put safety glasses on (look around all 3 rooms in the lab if you cannot find any)
- [ ] Turn on the wheel (button on the computer screen) and let it run for 10 minutes if it has not run yet today.
- [ ] Turn on the coolant (button on the computer screen)
- [ ] Use the pipette to take up some coolant and make a refractrometry reading. Record this in the grinder notebook.
- [ ] Turn off the coolant.
- [ ] Turn off the wheel if it has been on for more than 10 minutes. (Fine to leave it on, too, it just might get in the way.)
      
**Sample placement**  
When flattening, you are trying to minimize time spent flattening while maximizing the number of samples that are flattened to the same heigh. So, select bars with samples that are already very close to the same height. If you don't have any, that's ok, you can flatten (and image) one bar at a time. Better to do that than spend hours needlessly grinding some bars way more than they have to be to get flat.   
Note: One of the UV brick lights gets in the way of the table, so the table **can only move so far in the Z (horizontal L/R) direction!!**  
**Z-limits (in MACH coordinates): 0.5" to 13"!**  
- [ ] Put a little 3-in-1 oil on bars and grinder chuck. 
- [ ] Place bars on chuck **ensuring that the table will not hit the UV light!!**
- [ ] Engage magnet.
You are now ready to set up your grind.

## 2. Setting up a rasterflat run.
We will always *raster* flatten our samples. It is better for the wheel and leads to a nicer finish. This means we take make one pass over the whole grinding area, then move the table up one step and do it all again. It takes a while, which is why it is imperative that your samples are mostly flat and mostly the same height before you begin.  

#### A. Measure your grinding area.  
FIRST: Move the table in the Y direction (vertical) so that there is at least an inch of space between the bottom of the wheel and your tallest sample. This ensures you do not accidentally damage the wheel.  

##### i. R and L TEACH
As the rasterflat code proceeds, the grinder will move the table in the Z direction (north-south) between two points called **L TEACH** and **R TEACH**. As the name implies, we have to "teach" these positions to the computer. Do this by moving the table so that the wheel is over the farthest left (north) edge of your samples + 0.5". At its maximum extent, this should be Z=0.5 in MACH (machine) coordinates. Press **L TEACH** on the right side of the control computer screen.   

Now, move the table so that the farthest right (south) side of your samples has cleared the wheel. At its maximum extent, this should be Z=13 in MACH coordinates. Press **R TEACH**.

To test, you can **START** the table. The table should move back and forth between the L TEACH and R TEACH points you set. Stop the table.  
##### ii. X dimension
Next, we have to figure out how wide the grinding area is (X direction or east-west). We will record this parameter in the G-code as ```X```. To do this:
1. Move the table in X so that the wheel is closer to you than all of your samples, with only a half-wheel overlap of the closest sample. (furthest west). Write down the X position in MACH coordinates:  
X0 = ____  
2. "Zero" the position so that we can come back to this X position later. (Press POS, ALL, 0 SET). All REL positions should now be zero.
3. Move the table so that the wheel is farther away from you (+half-wheel thickness) than all of your samples. Again, record the X position in MACH coordinates:  
X1 = ____  
4. The difference between X1 and X0 is the ```X``` value we will record in the G-code line that reads:
   ```G91G01X6.5F150```
You can go ahead and edit that line now to whatever you calculated. Round to one decimal point.

##### iii. Y start
You want the grind to start as close as possible to the tallest part of your sample. So, move the table well away from the wheel and lay a ruler or other flat object on top of your samples to figure out where that spot is. Once you have a since for the tallest region:  
1. Turn the wheel and coolant on (press the buttons on the control computer screen) and make sure you are wearing safety glasses.
2. Move the table so that the tallest area of your samples is close to underneath the wheel.
3. Move the table up (Y dial) *sloooowwwwlllyyyy* just until you hear the wheel barely graze the top of your sample. You should use the ```x1``` movement increment (0.0001") when you get close to the wheel.
4. Back off one or two clicks.
5. To check that you really did find the tallest spot, slowly move the table around in the horizontal (X-Z) plane to make sure the wheel doesn't touch anywhere else. If you were right, great. If not, re-calibrate with whatever new tallest area you found. Moving slowly ensures you do not damage the wheel.  

At this point, the Y position (in all coordinates) should be close to where we want to start the grind. However, ```rasterflat``` *starts* by raising the table 0.001". To account for this, we should start with Y backed-off at least 0.001" from the tallest point you found.  

6. Switch to the ```x10``` movement increment (0.001") and move Y 1 click *more positive** (table down). At this point, you will not touch the Y dial again.

##### iv. Move to the starting position
The program does not "get" any positional information from the grinder -- we must start the program from the position we want it to begin grinding at. To accomplish this,   
1. Move the table in X until X = 0.00000 in REL coordinates (you set this point before).
2. Move the table in Z until the Z value is close to your L TEACH value (this is recorded on the computer screen).
3. (Y should not have moved since you set the table height in the step iii!)

#### 2. Record your parameters and edit the G-code.
There are some important parameters that we have to record -- in the grinder notebook and in the grinder's G-code -- before we can begin.
### PARAMETERS.
Fill these out at the start of each "run" (each time you re-start the program rasterflat.txt!) We will document the parameters used for each run in the Grinder Notebook (which lives in the grinder computer room). 

#### Check and adjust these parameters in the G-code:
- ```L##```, where ## is a number (e.g. 50) that tells the grinder how many times to **L**oop (i.e. how many times to raster over the grinding area). **Do not set L>200**. If L is too large, we risk grinding away all of the rock. Let's avoid that.
- ```X#.#```, this is the difference (X1-X0) you calculated in step ii.4.
- ```F###```, the **feed rate** determines how fast the table moves under the wheel. **150** is a good starting point. If the samples are very hard (e.g. they contain a lot of chert or iron), a slower feed rate (100?) might be better. In general, do not change this if it is already set to 150.
- ```Y-0.001```, *just check* that the Y increment is set to -0.001. This is how far we will step the table up (closer to the wheel) each raster.
  
**IF YOU DO NOT KNOW WHERE THESE PARAMETERS EXIST IN THE ```rasterflat``` CODE, CHECK THE EXAMPLE CODE (```20250121.demo.rasterflat.txt```) AND ASK JULIA/ADAM.** Note that you can always demo your code by moving the table in Y so that it is very far away from the wheel and running one loop (L1) to see how the table moves. **But, it is better to just ask questions!!**

After checking/adjusting these four parameters, you can save the G-code file. Do not overwrite the ```20250121.demo.rasterflat.txt``` file. Instead, rename your file in the format:  
```YYYYMMDD.INITIALS.FXXXX.rasterflat.txt```  
```YYYYMMDD```: today's date.  
```INITIALS```: your initials.
```FXXXX```: the "**F**lattening group" you are about to grind flat.  
e.g. If I am going to flatten flattening group 1 (the first set of 2025 flattened bars) today, my code would be called:  
```20250123.JKW.F0001.rasterflat.txt```

#### 3. Start the code
At this point, the table should be in the position you want to start at. the X and Z REL positions should be very close to 0.0000, but REL Y will be some other number. **Reset everything to 0** before you start the run. (POS > ALL > 0 SET).  

If the table is positioned correctly, **the magnet is engaged**, you did everything on the checklist, and you have recorded your L,X,F parameters in the notebook, you are ready to press ```PROGRAM START``` (big green button).  

Stay in the room and monitor the first pass over your samples. If everything went as planned, you can leave. Sometimes it is helpful to time the first loop so that you have a sense for how long the whole run will take.

## 3. Finishing a run.
The code ends on its own and will stop the table, turn off the wheel, and turn off the coolant. So, it's okay if a run ends and you are not around to witness it. When you do come back to retreive your samples, if the samples do not look totally flat yet, restart your code (think about adjusting ```L``` depending on how much more material you want to remove) *without adjusting the final Y position*.   

If your samples are flat, you are done. Just a few more things to do:
- [ ] Record the final Y position (in MACH coordinates) in the grinder notebook. It will be something like -7.5757. (In REL coordinates, it should be 0.001 * the number of loops (L) that you ran.) The final Y MACH will help us focus this batch of samples.
      Y MACH at end: _____
- [ ] Move the table down so that the samples are far away from the wheel.
- [ ] Disengage the magnet
- [ ] Take a picture of each bar using the Nikon camera. Save the photo in the "PostGrind" folder and record the image number in the "PostGrind" .txt file. Place the imaged bars in a tray and make sure the tray is labeled appropriately.
- [ ] Mark each of the samples you flattened as "flattened" on the master spreadsheet.

### TROUBLESHOOTING
**Help! I need to stop my run!**
You can always press PROGRAM STOP to stop the execution of whatever G-code script is running. If things are really bad, you can also hit the emergency stop button (big and red). Stopping the program does not stop the table moving, so you also have to press TABLE STOP. Adjust your code, fix whatever went wrong, and re-start (or ask Adam/Julia!). (It is not bad to stop a run for any reason.)

### A. Sub-routines.
#### 1. Mixing coolant.
If coolant levels are below 6" (use the yellow measuring stick to measure), you need to add more coolant. If levels are just below 6", make one recipe (5L water). If levels are well below 6", make a double recipe (10L water).  
**COOLANT RECIPE**
1) Pour 5L of **DI water** into grey bucket.
2) Pour 125 mL of **Astrogrind** coolant (in cabinet) into plastic measuring cup (on sink).
3) Add the Astrogrind into the bucket of water.
4) Stir with the wooden paddle.
5) Once mixed, add the whole mixture to the coolant tub **through the filter paper**
