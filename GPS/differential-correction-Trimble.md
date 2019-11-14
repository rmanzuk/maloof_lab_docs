# Differential Correction of Trimble Data

### Important Contact Info
Manager the GPS Pathfinder Office Licenses:  
Bill Guthe  
PHONE: 609-258-4609  
EMAIL ADDRESS: wguthe@princeton.edu  
OFFICE LOCATION: 332 Lewis Library


### What you need:
- Floating License of GPS Pathfinder Office
- VPN set up in case of issues with Pathfinder
- Trimble Rover
- SD card in Trimble
- Micro-USB to USB/USB-C (Normal Micro-USB cables do not fit into the Trimble, you have to use a pocket knife to cut part of the rubber around the Micro-USB end so it will fit into the Trimble)
- batteries
- charging cable


### Before Going to the Field
#### 1. VPN
Make sure you have a VPN on the computer you will use in case you run into any issues with the GPS Pathfinder license. Below is how to do it for Windows 10. But you can get instructions by just Google-ing 'Princeton University VPN'.
1. go to https://remote.princeton.edu
2. Select "Princeton University" for the "Log in to:" field and click **Next**
3. Enter your PUID and password
4. Install Connect Tunnel
5. Click **Save File**, then double click "setup65.exe" and install the software
6. Once installed, restart the computer. Click **Yes** to complete the installation.
7. To login to VPN, type "SonicWall" in the search box in the bottom left of your screen and double-click **SonicWall VPN Connection APP**
8. If this is the first connection, you may need to type in "remote.princeton.edu" for the servername.  Then, enter your Princeton netID and password, then click **Connect**.
9.  You will receive a Push or Call to your primary Duo device. While SonicWall is waiting for approval from Duo, you will see a “Connecting...” windows displayed.
10.  Your System Tray will momentarily notify you of a successful connection.
11.  To disconnect from Secure Remote Access, right-click the Sonicwall VPN Connection or Princeton Secure Remote Access shortcut on the Desktop or System Tray icon and select Disconnect.

#### 2. Check-Out Floating License
- Open the application, <u>GPS Pathfinder Office License Administrator</u>.
- Select **Floating**, the server address should be "cseslicense02.princeton.edu".
- click **Borrow License...**
- Select **4 Weeks**, and **Borrow Now**, a window should pop up saying 'The License was borrowed successfully'.

#### 3. Testing
###### VERY IMPORTANT:
Take the computer off campus (not on campus WiFi) and try to go through the entire differential correction process before leaving Princeton.

## Differential Correction
#### 1. Import Data From Trimble
Easiest to do by plugging the Trimble into the computer, but can also be done with the SD card. Following instructions are for when the Trimble is plugged into the computer.
- Plug in Trimble to computer
- Select **Utilities** --> **Data Transfer**
- Make sure the Device selected is "GIS Datalogger on Windows Mobile", then press the button just to the right with the green check mark.
- Click **Add**
- Then select your data and import

#### Differential Correction
- From the **Utilities** tab, select **Differential Correction**
- Choose the file you wish to correct, and press **Next**
- Use **Automatic Carrier and Code Processing (Recommended)** and **Use a single base provider**, click **Next**, and **Next** again.
- Click **Select** in the Base Provider Search
- Press **Update List**,  then choose a base station close to where your data is, then select **OK**, then select **Next**. **NOTE: I have had the best luck with stations that have both L2 and G files**
- Use the defaults for the output folder and filename. Select **Start**, when it finishes, select **Confirm**.
- When it finishes, copy the 'Differential Correction Summary' and save it in a .txt with named 'fieldsite-year-summary.txt' (i.e. amato-2019-summary.txt).
- Press **Close**

#### Export
- On field computer in Lenovo ThinkPad Carbon we are using in 2019, use 'Export to .CSV' as the export setup and press OK
- If you are using a different computer,  press **New...**
- In the New Setup Window, create your name, make sure 'Configurable ASCII' is selected in the 'New Setup', Click **OK**
- Click **Configurable ASCII** tab
- click **New** under template list and give the template a name, **OK**
- make sure **points**, **lines**, and  **area** are selected. 'Field Format' is 'Delimited', use preset delimiters.
- type in file extension, 'csv'
- check on 'Use Template as Heading'
- In 'Macro Palette', select **Feature ID**, **Feature Name**, **Lattitude**, **Longitude**, **Northing**, **Easting**, **HAE**, **MSL**,  **Attributes**, **GPS Time**.
- Click **OK**
- click 'Attirubtes' Tab
- Under 'Point Feature', turn on: **Height**, **Vertical Precision**, **Horizontal Precision**, **Standard Deviation**, **Position**, and **Point 1D**.
- Under 'Line Feature', turn on: **Length (2D)**, **Length (3D)**, **Average Vert. Position**, **Average Horiz. Precision**, **Worst Vert. Precision**, **Worst Horiz. Precision**.
- Press **OK** and then **OK** in the export window.
- This produces a '.csv' called 'Point_generic.csv' in the Export Folder of your working directory. Change the name of the '.csv' to the field locality and year. (i.e. 'amato-2019.csv').
