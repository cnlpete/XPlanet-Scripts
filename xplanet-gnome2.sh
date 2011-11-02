#
# Written by Patrick Jennings
#
# This xplanet script can be used to automatically update a users
# gnome desktop background.
#

#!/bin/bash

homeDir=${HOME}

# Usually the monitor size.
#trying to guess this...
geometry=`(xrandr --current | grep '*' | uniq | awk '{print $1}')`
##and giving a fallback on failure
if [ -z $geometry ]; then
	geometry="1680x1050"
else
	echo "guessed $geometry"
fi

# Where the xplanet config file is located
configFile=$homeDir/.xplanet/config/config

# The name of the desktop image
outputFile=$homeDir/.xplanet/images/wall.png

# Here are some options you may want to edit. Read `man xplanet` for
# a detailed explanation of each option.
xoptions="-num_times 1 -longitude 0 -latitude 0 -body earth \
	-projection rectangular -quality 100 -light_time -verbosity -1"

# Get the correct earth map
month=`/bin/date +%m`
/bin/ln -sf $homeDir/.xplanet/images/earth_${month}.jpg $homeDir/.xplanet/images/earth_monthly.jpg

# Get the cloud map
python $homeDir/.xplanet/xplanet-download_clouds.py \
	$homeDir/.xplanet/images/clouds_4096.jpg

# Run xplanet with a high nice value.
xplanet -output $outputFile -geometry $geometry -config $configFile \
	$xoptions
 
# Update the Gnome backgound
gconftool-2 -t str -s /desktop/gnome/background/picture_filename $outputFile
