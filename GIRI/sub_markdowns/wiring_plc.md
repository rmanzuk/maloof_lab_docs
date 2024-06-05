## Wiring / electronics with PLC

#### Programable Logic Controller (PLC): 

To send signals between the grinder, control computer, and electronic peripherals, we use a programable logic controller (PLC). Our PLC is an Allen-Bradley Micro850 2080-L50E-48QVB. We chose a micro850 (L50E) unit as those are the current in-use units from Allen-Bradley. We previously had a Micro830, but those have since reached end-of-life. The 48QVB suffix in the part number refers to where we have to select the right model to fit our needs. A handy breakdown of different models can be found in [this guide](https://literature.rockwellautomation.com/idc/groups/literature/documents/sg/2080-sg001_-en-p.pdf), specifically on page 6. 48 refers to 48 inputs/outputs (28 inputs, 20 outputs), which we like to give us more room to expand peripherals. The QVB means the PLC takes 24V inputs and gives 24V *sinking* outputs. Note that most electronics do not take sinking outputs (also known as NPN), and instead require sourcing outputs (also known as PNP). We need the sinking output PLC model because that is what the grinder requires.  
  - [Manual for Micro800 controllers](https://literature.rockwellautomation.com/idc/groups/literature/documents/um/2080-um002_-en-e.pdf)

***A note on sourcing vs. sinking***: 
  - In general, sourcing and sinking is all about the direction of current flow in a DC circuit. For PLC systems, this concept describes the current flow relationship between digital PLC inputs/outputs and the input/output devices deployed in the field.
  - **Sourcing PLC input module**: In a sourcing system, the PLC provides the positive voltage to the field device, and the field device provides the path to ground. In other words, the PLC sources the current to the field device. 
  - **Sinking PLC input module**: In a sinking system, the PLC provides the path to ground, and the field device provides the positive voltage. In other words, the PLC sinks the current from the field device. 
  - **Sourcing PLC output module**: In a sourcing system, current will flow out of the PLC output module into the connected load. This is also known as **PNP** (positive-negative-positive) or N.O. (normally open) logic.
  - **Sinking PLC output module**: In a sinking system, current will flow from the connected load into the PLC output module. This is also known as **NPN** (negative-positive-negative) or N.C. (normally closed) logic.
  - **Sourcing PLCs are more common** because they are easier to wire and troubleshoot. However, some devices require sinking outputs, like the grinder.
  - For more information see this [website](https://www.dosupply.com/tech/2022/05/16/sinking-vs-sourcing-in-plcs/).

#### PLC modules and expansions: 
Because the PLC base is limited to digital inputs, and sinking digital outputs, we have several modules and expansions to allow for analog inputs/outputs, and sourcing digital outputs. Modules refer to rectangular blocks that install on top of PLC. Expansions install on the side of the PLC.
  - 2080-IF4 module: This module gives us up to four analog input channels. Currently, we use this module to get inputs from the temperature and humidity sensor.
  - 2080-OB4 module (x3): These modules give us four channels of sourcing outputs each. Because our PLC only has sinking outputs, we need these modules to send signals to most other electronics including: 
    - The ring light, which has 8 channels, and takes up two modules.
    - The grinding sensor (currently not in use).
  - 2085-OF4 expansion (x2): We have the option of controlling the brightness of each channel of the ring light by sending a 0-10V analog signal,10V being the brightest. These expansions give us the necessary 8 channels of analog voltage output. Currently, these modules are not in use, and the analog inputs to the ring light controllers are sent directly from the 24V power supply, leaving them at maximum brightness. If dimming control is wanted in the future, these modules could be used. That implementation would require new ladder logic.
  - 24 V power supplies: We have two 24V power supplies to power peripherals. The 1.6 amp unit directly attached to the PLC has enough current to send signals to the grinder, and power the PLC and temp/humidity sensor. As we added fancier lights, we needed more 24V current, so we have the 5 amp Eaton unit to provide reliable power to all LEDs.

#### Ring light:
We have a custom LED ring light built by Jeremy Broderson at Phi3 (~Jbrodersen@phi3.net~). Not much documentation was given with the light, but most information about controlling it can be found below with the [4ZMD controllers](https://smartvisionlights.com/wp-content/uploads/4ZMD_Datasheet.pdf). Included wavelengths in the light are: 470nm, 505nm, 530nm, 590nm, 625nm, 670nm, 740nm, and 940nm. The order in which they are controlled depends on the attachment of the 4ZMD, but they generally go in descending wavelength order. We currently have a hand-cut linear polarizing film from American Polarizers ([AP42-004T](https://www.apioptics.com/product/ap42-004t/)) placed between the lights and the diffuser window to help reduce specularity. Drawing for the ring light attached:
[Ring light full assembly](../cads_drawings/ring_light/FULL%20ASSEMBLY%205-19-2023.STEP)

#### 4ZMD Controllers: 
The ring light is controlled by two [4ZMD](https://smartvisionlights.com/products/4zmd/) devices from Smartvision (4 channels per controller). These devices allow us to control brightness through an analog input to each channel, and trigger the lights through PNP input lines. PNP means **these triggers require a sourcing output from the PLC**. Currently, We have the analog lines wired directly to our 24V power supply, so the brightness is not modulated, and they run at full brightness always. If brightness control were desired, the devices would have to be rewired to the 2085-OF4 expansions on the PLC and coded into the ladder logic.
  * Mini LED fix: We had some issues with the little indicator LEDs on the 4ZMDs not turning on even when a channel was successfully triggered and the rind light turned on. This issue likely relates to the PCB driver blades shifting during shipping or handling. The fix is easy and can be done with the unit installed. Simply disconnect power, remove the front face cover and use a plastic pen, not metal, to push the board socket contacts down so the blade seats in the socket.
    * [photo 1](../photos/4zmd_fix/4zmd1.jpg)
    * [photo 2](../photos/4zmd_fix/4zmd2.jpg)
    * [photo 3](../photos/4zmd_fix/4zmd3.jpg)

#### UV brick light:
#### air:
#### connections to grinder:
#### temperature/humidity sensor: