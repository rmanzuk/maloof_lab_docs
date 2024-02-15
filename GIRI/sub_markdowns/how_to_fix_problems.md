# Some problems we've encountered and how to fix them
Add to this if you have a problem.

1. Grind stops for no apparent reason
- Is the sample in imaging position or grinding position?
    - (GRIND coordinates should be 0 for grind position)
    - If it's in grind position (i.e. not under the camera), did it finish the grind? Did the grind get imaged yet? 
    - If it's in imaging position and the computer says it took photos, check the last set of photos. You can also count the number of sets of photos it did take and compare that to the number you expected.
    - run ```recover_grinding_slice``` just in case. Compare these new images to the last set the program took. Keep them if they're different, otherwise delete them. (Wet the sample before you take images.)
- Check the computer > PLC connection
    - If you were able to run ```recover_grinding_slice```, this connection is fine and probably was not the problem.
    - Try turning the lights on and off.
- Check the PLC > Grinder connection (if computer > PLC works)
    - manually try grinding or teaching or something. (I (Julia) am unclear about this process because this has always been the problem for me so far.)
- POWER CYCLE
    - Unplug the PLC and plug it back in
    - Restart the grinder software (control-alt-delete).
    - Try to start a grind again. Hopefully everything is okay.
**Example scenario:**
Grind stopped overnight. Last command was JOB START and it was sent and received, so grind 111 should have begun. Images from grind 110 were taken and the sample was still in imaging position. There were no yellow lights on the PLC, "START" was still yellow on the grinder computer. The computer to PLC connection was fine and I was able to ```recover_grinding_slice``` (deleted the photos).
**Solution**:
I restarted the software on the grinder computer, moved the table back to x=0 in grinding coordinates, changed the number of grinds, and pressed start. It is working. (I did not have to power cyle the PLC.)
