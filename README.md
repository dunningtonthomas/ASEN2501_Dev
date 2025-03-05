# ASEN2501_Dev
Lab Software of ASEN 2501 Intro to Astro


## Muscle Sensor

The Sparkfun MyoWare muscle sensor is an analog sensor. The code in this repo uses the Arduino Hardware package in MATLAB to interface with Arduino boards and collect the data from the sensor. Ensure this package is installed before running the application.

The application assumes the analog input on the Arduino is connected to the ``A0`` pin.

To save data you can specify the filename and it will save to the `Data\` folder within the directory of the application.

Additional sparkfun code examples: https://github.com/sparkfun/SparkFun_MyoWare_Code_Examples

