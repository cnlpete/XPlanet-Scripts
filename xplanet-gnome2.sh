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

set $(python $homeDir/.xplanet/geoclue.py)
latitude=$1
longitude=$2
echo "using position $latitude , $longitude as position"

# Where the xplanet config file is located
configFile=$homeDir/.xplanet/config/config

# The name of the desktop image
outputFile=$homeDir/.xplanet/images/wall.png

# Here are some options you may want to edit. Read `man xplanet` for
# a detailed explanation of each option.
xoptions="-num_times 1 -longitude $longitude -latitude $latitude -body earth \
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
GVERSION=`(gnome-session --version | awk '{print $2}' | cut -d '.' -f1)`
if [ $GVERSION -eq 3 ]; then
	##gnome3/unity
	gsettings set org.gnome.desktop.background picture-uri file:///$outputFile
else
	gconftool-2 -t str -s /desktop/gnome/background/picture_filename $outputFile
fi
