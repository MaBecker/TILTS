#1N4148 temperature profile

######description

use the temperature effect of a diode to messure temperatures between 100 and 400°C

######circuit

+3.3v -- R 10KΩ -- heat resistant wire -- 1N4148 -- heat resistant wire -- GND

######use case

calibation off an solder ion without temp control but with a poti for fixed temperatue setting without display
	
######how

heating up the diode will decrease the internal resistance and the voltage drops

![1N4148_temperature_profile.JPG](images/1N4148_temperature_profile.JPG)

    source: http://thomaspfeifer.net/laminator_temperatur_regelung.htm


######solder ion is off

![1N4148 solder ion is off 559mV](images/1N4148_off_559mV.jpg)

######solder ion heated to round about 270°C

![1N4148 270°C 247mV](images/1N4148_270C_247mV.jpg)

######create your own temperature profile

used a very precise temperature control solder station and eg changed temperature from 100°C to 325°C  in steps of 25°C
or  just go for some temperatures like  180°C and 190°C

![1N4148 temperature plot 01](images/1N4148_temperature_plot_01.jpg)

Note: wobbles are comming from the solder station, so go for a graph with arithmetic average values 




