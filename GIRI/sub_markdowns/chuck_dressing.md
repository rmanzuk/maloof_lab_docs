## Dressing the magnetic chuck

In general, refer to this [video](https://www.youtube.com/watch?v=ChH6ORg3Iq0&t=370s) for a good overview of chuck dressing. The video covers pretty much everything in this document.

Prior to dressing the chuck, you must prepare a silicon carbide wheel, so this document will be split into two sections: wheel preparation and chuck dressing.

#### Silicon carbide wheel preparation

The video linked at the top covers some wheel prep, but this [video](https://www.youtube.com/watch?v=MofRhM_W-Vk&t=652s) has a bit more detail specifically about carbide wheel dressing.

1) Safety glasses on!

2) Assemble silicone carbide wheel and balance according to instrctions in the [wheel balancing and truing](sub_markdowns/wheel_balancing_truing.md) section.

3) Mound the wheel on the spindle.

4) Place the single point diamond dresser on the chuck under the lowest point of the wheel. If anything, the dresser should be on the left(downstream) side of the wheel. The dresser has a lean to it, so make sure the lean is in the downstream direction for the wheel, which means it should be leaning leftward.

5) Engage the magnetic chuck and turn on the spindle.

6) Slowly lower the wheel to be just above the highest point of the diamond. 

7) At this point you're read to dress the wheel. Prepare the axis jog increments such that you can move fairly quickly along the x-axis (like a normal feed rate), and such that clicks on the y-axis movement wheel are 0.001".

8) Continue to lower the wheel slowly over the dresser, moving at 0.001" increments in the y-axis. 

9) Once you hear the wheel start to make contact with the diamond, move along the x-axis at a normal feed rate such the entire wheel with passes over the dresser.

10) Continue to make passes of the wheel over the dresser, dropping the wheel by 0.001" increments in the y-axis each time. At first, while the wheel may be out of round, you will possibly hear chatter. Listen for the chatter to go away with each pass, as you can stop dressing the wheel when the sound with each pass is a smooth, unbroken hum. Getting a trued wheel should only take a few passes. Once the wheel sounds trued, perform 2 more passes, but only drop the wheel by 0.0005" for each.

11) Turn off the spindle.

12) The wheel is close to ready. For an ideal finish on the chuck, you should now remove the wheel from the spindle and re-balance it. Once the wheel is re-balanced, put it back on the spindle and lower it over the dresser again. Now, you should only need to make 1-2 passes, with the wheel dropping by 0.0005" each time. This slight repeat of the procedure helps to ensure the wheel is perfectly round and balanced.

13) Disengage the chuck to remove the dresser. Before putting the dresser away, be sure to loosen the diamond from the holder and rotate it 90 degrees. This will help to ensure the diamond wears evenly.


#### Dressing the chuck

1) Safety glasses still on!

2) Turn on the magnetic chuck. You always want to dress with the chuck on because this will harden the chuck, so it won't heat and warp during dressing.

3) Dressing the chuck will be easiest if you know where the highest point on the chuck is. You can find this by using a dial indicator. Attach the indicator magnetically to the spindle housing, and set the indicator to touch the chuck. Use the grinder feeds to move the chuck under the indicator, and note the highest point.

4) Bring the wheel over the highest point and lower close to the chuck, without making contact.

5) At this point, turn on the spindle and coolant. Coolant should be on at all time to dissipate any heat during dressing. Heat is bad because it can cause the chuck to warp.

6) Lower the wheel VERY SLOWLY, with increments in the y axis of 0.00001". Chuck dressing is not an aggressive grinding process. Continue to lower slowly, listening for the sound of the wheel on the chuck. At such a slow rate, it may take a while, but be patient. NOTE: if you were not able to find a definitive high point on the chuck, left and right teach the table such that when you start the table, it runs the entire length of the chuck. Do this lowering process with the table moving, only lowering the wheel by 0.00001" per pass.

7) Once you hear the wheel make contact with the chuck, I would raise the wheel up by 0.0002", just in case finding the high point was not perfect. 

8) 0 set all relative positions so you know where you are, especially in the y-axis.

9) With the coolant and spindle on, run the G code program `mag.chuck.dress`. This program starts on one corner of the chuck and moves along the entire length of the chuck in the z-axis before stepping over in the x-axis and returning in the z-axis. The program itself does not lower the wheel.

10) Once the program has completed its first pass over the chuck, you can lower the wheel. Never lower the wheel by more than "half a tenth" (0.00005") at a time. Again, this process is not aggressive. After lowering the wheel, run the program again.

11) As you make passes and lower the wheel, you should start seeing the wheel in contact with more and more surface area of the chuck. There may be some sparks as it makes contact, but it should not sound or look too aggressive.

12) Continue to make passes and lower the wheel until you have dressed the entire chuck. Then, without lowering the wheel, run the program at least 3 more times to ensure the entire chuck has been dressed and any potential warping has been removed.

13) Once you are satisfied with the dressing, turn off the spindle and coolant. Disengage the chuck and remove the wheel. Chuck dressing is complete.