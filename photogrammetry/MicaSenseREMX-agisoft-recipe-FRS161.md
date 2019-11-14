# Agisoft Workflow for MicaSense RedEdge MX---Specifically for FRS161
Bolton Howes, November 2019

**note: This workflow is modified from [this ](https://agisoft.freshdesk.com/support/solutions/articles/31000148780-micasense-rededge-mx-processing-workflow-including-reflectance-calibration-in-agisoft-metashape-pro<strong), to make DEMs and Orthomosaics from MicaSense RedEdge MX photographs**

<!---Press control+shift+m to view in markdown-preview in atom-->

## 1. Add Photos (5 minutes)
- open Workflow menu and choose Add Photos. Select all images including reflectance calibration images and click OK. Select the "Multi-camera system" option.

## 2. Locate reflectance panels
- open Tools Menu and choose Calibrate Reflectance. Press "Locate Panels" button.
- Images with the panel will be moved to another folder and the masks will be placed over the images. If the images are not automatically, see Appendix A from [this workflow](https://agisoft.freshdesk.com/support/solutions/articles/31000148780-micasense-rededge-mx-processing-workflow-including-reflectance-calibration-in-agisoft-metashape-pro<strong). You may need to load a CSV with the calibration information.

## 3. Run reflectance calibration (2 minutes)
- Check on "use reflectance panels" and "use sun sensor" option sin the Calibrate Reflectance dialog to perform calibration. Click OK to start the calibration.

## 4. Enter Ground Control Points (GCPs)
- click on the 'Reference' panel, which is in the bottom left of the Metashape window.
- Right click in the Markers on the left middle panel, and select 'Add Marker'
- Input the differentially corrected Lat/Long/Elev/Uncertainty
- Then right click on the marker you just created and select 'Filter Photos by Markers'
- In the 'Photos' panel only the images with your marker will be present. Double click on one of the images, then drag the predicted marker position to the actual position. Do this on at least 10 of the photos, more if you are feeling ambitious.
- Repeat for all of your GCPS

## 5. Convert from Lat Long to UTM
- In the Refernce panel, the fourth icon from the left is the 'Convert' button. Hover the mouse over it to make sure, then click it.
- The camera is in WGS 84 Lat Long, to convert to UTM, click on the drop down with WGS 84, then select 'more options'.
- Find the appropriate UTM Zone, for example the UTM for Mesoraca, Italy is 33S. So after selection the drop down window would say "WGS 84/UTM zone 33S (EPSG::32733)"
- Make sure both 'Cameras' and 'Markers' are checked on
- press OK

## 6. Align Photos (>5 hours for 1,000 photos. Depends somewhat on GCPs)
- Workflow --> Align Photos
- Use Accuracy: High
- Generic preselection and Reference preselection are checked on.
- Key point limit: 40,000
- Tie point limit: 4,000
- Adaptive camera model fitting OFF

## 7. Optimize Cameras (10 minutes per iteration. ~1-2 hours)
- From the 'Tools' menu select 'Optimize Cameras'. In the 'General' panel check on all options except 'Fit p3', 'Fit p4', and 'Fit k4'.
- This now becomes an iterative process. Under the 'Model' Menu, select 'Gradual Selection' and then choose 'Reprojection Error'.
- Now drag the bar to select the high error points, press 'OK' and then Delete on your keyboard (the backspace button doesn't work. It must be the Delete key).
- Now optimize cameras again.
- Repeat this 'Gradual Selection' and deletion until all the points have a reprojection error below 0.2, or at least kind of close. You will have to delete a lot of points, but don't worry. It actually helps in the end and makes next steps faster.

## 8. Build Dense Cloud (Time: 4hrs for 1,000 photos)
The Dense Point Cloud allows us to reconstruct a more accurate DEM.
- Workflow --> Build Dense Cloud
- Quality: Ultra High
- Depth Filtering: Agressive
- Calculate point colors checked on.

**Note: if you do not use Ultra High setting, your DEM will be downsampled and at MUCH lower resolution than the orthomosaic. for example, Medium produces a 1/4 resolution DEM compared to the orthomosaic.**

## 9. Build DEM (Time: 5 min)
- Workflow --> Build DEM
- Make sure the geographic projection is correct. Should be the same as Step 5
- Set interpolation to Extrapolated
- Press Ok

## 10. Build Orthomosaic (Time: 3 hrs)
- Workflow --> Build Orthomosaic
- Default settings
**Note: the Metashape estimate will say something like 12 hours, but it finishes much faster than that**

## 11. Exporting
- right-click on DEM in the 'Workspace', select export DEM
- Choose 'Export TIFF/BIL/XYZ'
- Leave the defaults, except only select 'Write BigTIFF file' in the 'Compression' panel.
- Repeat steps with Orthomosaic
