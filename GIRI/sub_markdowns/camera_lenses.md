## Camera

#### RCAM: 

The basis of our camera setup is a Digital Transitions RCAM, which is a solution for high-fidelity reprographic photography. This setup is common for libraries documenting/digitizing rare and important print works. The RCAM is basically a precision-machined metal tube that allows us to attach a medium-format digital camera back to one side, and a lenses (via lens boards and extension tubes) to the other side. 

#### Phase One IQ4 digital back: 
We upgraded to the Phase One IQ4 150 megapixel achromatic back in 2021. Prior to this sensor, we were using a Phase One IQ180 80 megapixel RGB back. This sensor gives the opportunity for high-resolution (~3.4um pixels) imaging of any lightwave in the back’s sensitivity range of ~400-1000nm. Note that the back itself has a digital shutter, so it should be complemented with lenses that have no shutter or have the shutter programmed to be constantly open. 

#### 120mm apochromatic Schneider-Kruznach Macro lens:
To achieve 1:1 macro photography, we use a 120mm Schneider-Kruznach APO-DIGITAR 5.6/120 M lens. This lens is apochromatic, meaning it is corrected for chromatic aberration in three wavelengths, and its wavelength vs. focal shift curve looks like a 3rd order polynomial ([figure](../photos/lens_info/chromatic_aberration.png)). We do have ways of assessing and correcting-for this chromatic abberation when doing multispectral imaging, see the supplemenary material of Manzuk, et al. 2022 for details ([link](https://gsapubs.figshare.com/articles/journal_contribution/Supplemental_Material_A_High-Resolution_Multispectral_Macro-Imager_for_Geology_and_Paleontology/19773532)).

Important note: the APO-DIGITAR 5.6/120 M lens no longer is in production, and we have not found a suitable replacement. THIS LENS MUST BE VERY WELL TAKEN CARE OF. The particular quality of the lens is in its focus flatness, that is, how it does not notably lose focus moving from the center to the edges of the image. We had tested a newer version of the lens, the aspheric, and found that it did not have the same focus flatness. A comparison of the two can be found in this [figure](../photos/lens_info/schneider_lens_comparisons.png).

We need extension tubes on this lens board to achieve 1:1 imaging. Specfically, between the lens board and the RCAm, we have a 30mm + a 40mm extention to give 70mm of extension. When installed, the setup should look like this [image](../photos/lens_info/lens_120mm_installed.jpeg). 

#### 72mm Schneider-Kruznach lens:

For larger field of view applications have a 72mm Schneider-Kruznach APO-DIGITAR 5.6/72 L lens. This lens is a lot less fancy, but achieves sharp images over an approximately 19 x 14cm field of view. 

This setup does not need to be installed with any extension tubes.

#### Wire grid polarizer:
Off-the-shelf, circular polarizers for photography only are effective in visible light. For broadband polarizing capability, we use a wire grid polarizer. We worked with a company Moxtek to create a custom solution that mounds to the 40.5mm filter thread of our lenses.

#### UV cut-off filter:
To avoid UV light contamination in our images, both due to any possible ambient sources, as well as when taking UV fluorescence images, we use a UV cut-off filter from Edmund Optics. The filter we use cuts-on at 390nm, and is monted on a 40.5mm filter thread ([link](https://www.edmundoptics.com/f/mounted-uv-filters/11546/)). 