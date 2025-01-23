# A COMPLETE GUIDE TO FLATTENING SAMPLES
## 0. Preparing your samples.
Are your samples...
-[ ] Glued?
-[ ] Documented in the notebook?
    page: ____
-[ ] Photographed on the Nikon
    photo number: ______
-[ ] Polished so that they are mostly flat?

**If all four of these steps are complete, you are ready to get the grinder set up.**

## 1. Pre-grinding preparation.
**Polish**  
-[ ] Polish steel plates:
    - Apply a drop of **sharpening stone oil** to the steel.
    - Using the **red stone**, polish in a figure 8 pattern until the stone passes smoothly over the steel.
    - Apply a few drops of 3-in-1 oil to the steel. 
    - Finish polishing with 10 figure-8s of the gray stone.
-[ ] Polish the chuck with the tan stone and 3-in-1 oil. Leave oil on the chuck.
**Check oil and coolant levels**  
-[ ] Check coolant levels. If less than 6", mix more coolant (see section 1.a. below.)
    -[ ] (Add coolant if needed)
-[ ] Expose new filter paper (on the roll)
-[ ] Check the back of the machine to see if leaked oil is close to filling up the overflow tub.
    - If it is, pour waste oil into the waste container
-[ ] Check lubricant levels on the front of the grinder. Refill with **Mobil Vactra** (blue container, in the cabinet).
**Turn the grinder/wheel on**
-[ ] Put safety glasses on (look around all 3 rooms in the lab if you cannot find any)
-[ ] Turn on the wheel (button on the computer screen) and let it run for 10 minutes if it has not run yet today.
-[ ] Turn on the coolant (button on the computer screen)
-[ ] Use the pipette to take up some coolant and make a refractrometry reading. Record this in the grinder notebook.
-[ ] Turn off the coolant.
-[ ] Turn off the wheel if it has been on for more than 10 minutes. (Fine to leave it on, too, it just might get in the way.)
**Sample placement**
When flattening, you are trying to minimize time spent flattening while maximizing the number of samples that are flattened to the same heigh. So, select bars with samples that are already very close to the same height. If you don't have any, that's ok, you can flatten (and image) one bar at a time. Better to do that than spend hours needlessly grinding some bars way more than they have to be to get flat.   
One of the UV brick lights gets in the way of the table, so the table **can only move so far in the Z (horizontal L/R) direction!!**
-[ ] Put a little 3-in-1 oil on bars and grinder chuck. 
-[ ] Place bars on chuck **ensuring that the table will not hit the UV light!!**
-[ ] Engage magnet.
You are now ready to start grinding.
## 2. Grind flat.
We will always *raster* flatten our samples. It is better for the wheel and leads to a nicer finish. This means we take make one pass over the whole grinding area, then move the table up one step and do it all again. It takes a while, which is why it is imperative that your samples are mostly flat and mostly the same height before you begin.  

There are some important parameters that we have to record -- in the notebook and in the grinder's G-code -- before we can begin.
### PARAMETERS.
Fill these out at the start of each "run" (each time you re-start the program rasterflat.txt!)
**L##**, where ## is a number (e.g. 50) that tells the grinder how many times to **L**oop (i.e. how many times to raster over the grinding area). 
**X#.#**, where #.# is a number with one decimal place that tells the grinder how far in X (towards the wall) to move. **This is the width of your sample**. As long as there is not much overhang on the steel plates and you positioned the bars well, this number should be about **6.5** (inches). (The bars are 6" long.)
**F###**, the **feed rate** determines how fast the table moves under the wheel. **180** works well, but is the limit of how fast we want to go. **150** is safer.



### A. Sub-routines.
#### 1. Mixing coolant.
If coolant levels are below 6" (use the yellow measuring stick to measure), you need to add more coolant. If levels are just below 6", make one recipe (5L water). If levels are well below 6", make a double recipe (10L water).  
**COOLANT RECIPE**
1) Pour 5L of **DI water** into grey bucket.
2) Pour 125 mL of **Astrogrind** coolant (in cabinet) into plastic measuring cup (on sink).
3) Add the Astrogrind into the bucket of water.
4) Stir with the wooden paddle.
5) Once mixed, add the whole mixture to the coolant tub **through the filter paper**

#### 2. Turning on the grinder
If the grinder 
