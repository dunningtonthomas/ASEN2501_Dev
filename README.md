# ASEN2501_Dev
Lab Software of ASEN 2501 Intro to Astro


## MATLAB App Hub
 
The `asen2501_hub.mlapp` is the central hub to select a sensor. Once a sensor is selected, the corresponding MATLAB app for that sensor will be opened. You can then connect to the arduino connected to the sensor by selecting the COM port and clicking the `Connect to Arduino` button. Once connected you can start a data stream to the live plot in the GUI and save and export data.

## Saving Data

In all of the sensor apps there is an option to capture data. To do this, you first specify how long to capture data for and the filename. For the filename, use either a csv or txt file extension, e.g. `testFile.csv` or `testFile.txt`. 

The app will save data for the specified time and save the data to the `Data` folder in the current directory. If a `Data` folder does not exist in the current directory, the app will create one.



## Muscle Sensor

The Sparkfun MyoWare muscle sensor is an analog sensor. The code in this repo uses the Arduino Hardware package in MATLAB to interface with Arduino boards and collect the data from the sensor. Ensure this package is installed before running the application.

The application assumes the analog input on the Arduino is connected to the ``A0`` pin. There are no required `.ino` scripts to be uploaded to the Arduino. The muscle app directly reads the `A0` pin and reads the data into MATLAB.


Additional sparkfun code examples: https://github.com/sparkfun/SparkFun_MyoWare_Code_Examples


## Air Quality Sensor

The Air Quality sensor is the SparkFun Qwiic Environmental Combo Breakout - ENS160/BME280 board and measures the air quality index (AQI), volatile organic compounds (VOCs), and C02 levels.

To use the app with this sensor, the `air_quality.ino` script must be uploaded to the Ardunio before running the app. Once it is on the Arduino, you can connect via the app and stream and save data.


## Dust Sensor

The Sharp GP2Y1010AU0F Optical Dust Sensor measures the dust density in ($\frac{mg}{m^{3}}$). 

To use the app with this sensor, the `dust_sensor.ino` script  must be uploaded to the Ardunio before running the app. Connecting and saving the data once this script is uploaded is the same as the other sensors.

