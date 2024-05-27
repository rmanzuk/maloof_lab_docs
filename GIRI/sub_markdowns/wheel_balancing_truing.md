## Wheel balancing and truing (and dressing)

#### General notes:
- This document specifically deals with preparing resin-bonded diamond grit wheels. The process for preparing the silicon carbide wheel for chuck dressing is detailed [here](chuck_dressing.md).

- The general purpose of balancing and truing a wheel is to ensure the wheel is round and rotating evenly on the spindle. Having a round, balanced wheel helps prolong the life of the spindle, and helps achieve a quality finish on the sample with minimal scratches.

- This process should be done:
    - When the wheel is brand new
    - When a wheel has been removed from its collar in between stints of grinding
    - When a wheel has been grinding for a few months consistently and the quality of the finish is degrading

- Schools of thought vary as to if you should re-balance the wheel after truing. Lately, I've been having fine results just balancing first and then truing (some say you should not think about removing and re-balancing the wheel after truing because that's the most in-round it will be). In general, I would maybe just repeat a balancing + truing cycle if the finish is not up to par.

- After truing, the WHEEL MUST BE DRESSED (detailed below) to open up the grit to cut.

- When handling wheels and balancing equipment, be very careful not to drop anything. Wheels are fragile and could break on dropping. The collars and axel used in balancing are also precision machined and should be handled with care as drops could damage their function.

---

#### Balancing the wheel:
Note: we have one of the less sophisticated balancing setups, so resources aren't too available online. This [video](https://www.youtube.com/watch?v=yYBXmqEU2r4&t=431s) shows the process with a similar setup. In the video, they drill the wheel to remove weight and improve balance, which is different from our weight sliding setup.

1) Install the wheel on its collar, using the specialized spanner wrench and hook wrench to achieve a secure fit.

2) Get out the balancing stand and check that it is level, probably best to level with a bubble or electronic level separate from the one on the stand. If you have difficulty achieving a level stand on the grinder lab work bench, you can try the Starrett granite slab in the machine shop.

3) Attach the axel included with the balancing stand to the wheel collar. Note the axel can only be attached in one orientation, so if it's spinning weirdly on the stand flip it around (update this section with the correct orientation during the next balancing session).

4) Start the process of checking balance placing the axel/wheel setup on one end of the stand and gently pushing it in the other direction to observe how it spins. The goal with the push is to give it enough momentum where it would barely make it to the other side of the stand. Any lurches or unevenness in speed as the wheel spins is an indication of imbalance.

5) To start honing on a balanced wheel, give it a roll where it does not make it to the other side of the stand. The wheel will stop, and you can treat the side that was down as the hypothesized heavy side. In its stopped position, mark the top of the wheel with a sharpie (antipodal to the heavy side, the top is just easier to see/mark). To test if this indeed is a heavy spot that needs to be corrected, you can either give the wheel another roll and wait for it to stop, or just bring the heavy side to the top (rotate the wheel 180 degrees) and release it to see if it immediately falls to the bottom and starts rotating. In either case, repeated settling of the same spot at the bottom (sharpie mark at the top) is a good indication that this is the heavy side.

6) To correct the imbalance, use an allen key to loosen the set screw in the weights that are nearest the heavy slide, slide them towards the lighter side, and tighten the set screw. You may have the best luck moving just one weight at a time and rechecking balance or moving multiple. Balancing is an imperfect science, just trust your intuition of moving weight away from the heavy side and making small adjustments when the wheel seems pretty close to balanced. 

7) Once the wheel is able to roll smoothly and can make it to the other side of the balancing stand even when given very little starting momentum, it's probably pretty well-balanced. Lately, even brand-new wheels have been pretty well-balanced with mostly evenly-spaced weights and only minor adjustments needed from there. If the process is taking overly-long, double-check the stand is level, because any slope there could hinder judgement of how the wheel is rolling.

8) Once you are satisfied the wheel is balanced, remove it from the axel, give the axel a thin coat of petroleum jelly to prevent rust, and carefully pack everything away. 

#### Truing the wheel: 
For further guidance in truing, you can watch one of the best Youtube [video](https://www.youtube.com/watch?v=V53EdcG35TA&t=404s) of all time. The video is very informative about the goals and processes of truing and dressing. It specifically starts the instruction on truing at 6:00. The process that they start with of tapping the wheel initially while checking for run-out with a dial indicator to will not be detailed here, but you could consider adding it to the process, especially for newer wheels.

1) SAFETY GLASSES ON

2) Install the wheel on the spindle, hand tightening the (reverse-threaded) nut to start, and then using the hook wrench and tube wrench to secure the wheel. The wheel will self-tighten as it spins, but might as well get it good and tight to start.

3) Raise the wheel (y-axis) so you can comfortably fit the brake-controlled truing device underneath. I usually then start the wheel and let it spin for a minute or so, just to warm up and self-tighten before truing. Now also is a good time to run a red crayon over the wheel while it's rotating. The red crayon will serve as a visual indicator of the high spots on the wheel as you true.

4) With the grinding wheel no longer spinning, install the brake-controlled truing device on the chuck directly below the wheel. Most importantly, make sure the diamond the spin axis of the truing device and the grinding wheel are parallel. The grinding wheel should be at least a few centimeters above the truing wheel at this point. Secure the truing device by engaging the magnetic chuck.

5) Turn the spindle/grinding wheel on, at the same speed you would use for grinding. 

6) Slowly start lowering the grinding wheel towards the truing wheel, making adjustments in the z-axis as needed to position the lowest point of the grinding wheel directly above the highest point of the truing wheel. DO NOT COME WITHIN ~1mm MAKING CONTACT YET.

7) You're now ready to start the truing process. Now is a good time to make sure you have a feed rate setup that will work for you. You'll probably want the x-axis feed rate to be at the x10 setting at the top of the screen, and the y-axis feed rate to be at the x1 setting. If you think it will be annoying to have to flip these when switching which axis you're adjusting, open up the jog menu and set the desired feed rates for the axes individually there. (you could stop/raise the grinding wheel while you get comfortable with the feed rates)

8) With the grinding wheel on, and positioned directly above the truing wheel (both in terms of x and z-axis), probably feeding it a few ten thousandths at a time. You don't want it to make contact while the truing wheel is stationary, so a little before contact is starting to feel imminent, get the truing wheel spinning counterclockwise before each burst of lowering the grinding wheel. Also be ready to work the x feed as contact becomes imminent. Once the wheel starts to make contact, use the x feed to move the grinding wheel across the truing wheel first clear to one side, then back the full width to the other.

9) At this point, I find it helpful to keep track of positioning, so I know how much truing I have done. Hit the position menu and 0 set all relative positions.

10) Time to make successive truing passes. The video says you can lower 0.001-0.002" per pass, but I find that to be a bit aggressive, so I tend to stick to 0.0005" per pass. Before each pass, make sure the truing wheel is spinning, and pass the grinding wheel across the full width of the truing wheel, and back. At some point, try to switch which side of the wheel you are starting passes with to ensure even truing. You also can occasionally bring the wheel up slightly, bring it over in x to the middle of the truing wheel, and drop it slowly to contact the truing wheel to start a few passes in the middle, again to ensure even truing. (sometimes you can get a nice rhythm going where you never have to start the truing wheel spinning with your hand because you're following quickly enough with the next pass that it's still spinning from the previous pass)

11) Depending on how it's feeling/sounding, you might want to stop the spindle after the first ~10-15 passes to check the crayon on the wheel and see how even it's getting. Otherwise, continue truing with the different styles of passes until the crayon is mostly gone. Depending on the state of the wheel prior to truing, hopefully this doesn't take more than 30-40 passes total.

12) Once you're satisfied with the truing, stop the spindle, raise the grinding wheel, and remove the truing device. The wheel is now ready to be dressed.

#### Dressing the wheel:
Dressing the wheel also is touched on in the Youtube video linked for truing. 

1) SAFETY GLASSES ON

2) Turn the spindle on, and get dresser sticks soaking up some coolant.

3) Starting with the coarsest stick, manually push the end of the stick into the wheel. I tend to do this at a bit of an angle, working from one side to the other and alternating starting sides. You'll want to make sure you're getting the full width of the wheel, and not just the center or edges.

4) After a few passes with the coarse stick, switch to the medium stick, and then the fine stick. You'll probably want to do 5-10 passes with each stick. The video says a half stick per dressing, but we have thicker sticks, so it's a lot less. Technically, you should finish with a stick that is 1-2 grit sizes smaller than the wheel, but 400 is the finest dresser stick we could find, so we just finish with that, even for the 400 grit wheel. It works fine enough.

5) Ready to grind. Keep an eye on cutting performance and quality of finish as you start to process samples. If you're not getting the finish you want, you might want to repeat the balancing and truing process.
