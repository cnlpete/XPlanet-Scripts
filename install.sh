#!/bin/sh

# Written by Patrick Jennings
# Modified by Hauke Schade
# install.sh v0.2

# Installs the xplanet scripts to the directory:
# ${HOME}/.xplanet
XPLANET_DIR=${HOME}/.xplanet
XPLANET_CONFIG_DIR=${XPLANET_DIR}/config
XPLANET_IMAGES_DIR=${XPLANET_DIR}/images
XPLANET_WORLD_DIR=${XPLANET_IMAGES_DIR}/download

SERVER="eoimages.gsfc.nasa.gov"
SERVERURI="http://eoimages.gsfc.nasa.gov/ve"

convert=/usr/bin/convert
convert_opts="-resize 2048x1024 -quality 95"

mkdir -p $XPLANET_DIR
mkdir -p $XPLANET_CONFIG_DIR
mkdir -p $XPLANET_IMAGES_DIR
mkdir -p $XPLANET_WORLD_DIR

##if online
if ping -c2 $SERVER > /dev/null 2>&1; then
	echo "Installing scripts..."
	cp config ${XPLANET_CONFIG_DIR}/
	cp xplanet-download_clouds.py ${XPLANET_DIR}/
	chmod +x ${XPLANET_DIR}/xplanet-download_clouds.py
	cp xplanet-gnome2.sh ${XPLANET_DIR}/
	chmod +x ${XPLANET_DIR}/xplanet-gnome2.sh

	echo "Downloading images..."
	[ ! -f ${XPLANET_WORLD_DIR}/01.jpg ] && wget -O ${XPLANET_WORLD_DIR}/01.jpg ${SERVERURI}/7100/world.topo.bathy.200401.3x5400x2700.jpg
	[ ! -f ${XPLANET_WORLD_DIR}/02.jpg ] && wget -O ${XPLANET_WORLD_DIR}/02.jpg ${SERVERURI}/7101/world.topo.bathy.200402.3x5400x2700.jpg
	[ ! -f ${XPLANET_WORLD_DIR}/03.jpg ] && wget -O ${XPLANET_WORLD_DIR}/03.jpg ${SERVERURI}/7102/world.topo.bathy.200403.3x5400x2700.jpg
	[ ! -f ${XPLANET_WORLD_DIR}/04.jpg ] && wget -O ${XPLANET_WORLD_DIR}/04.jpg ${SERVERURI}/7103/world.topo.bathy.200404.3x5400x2700.jpg
	[ ! -f ${XPLANET_WORLD_DIR}/05.jpg ] && wget -O ${XPLANET_WORLD_DIR}/05.jpg ${SERVERURI}/7104/world.topo.bathy.200405.3x5400x2700.jpg
	[ ! -f ${XPLANET_WORLD_DIR}/06.jpg ] && wget -O ${XPLANET_WORLD_DIR}/06.jpg ${SERVERURI}/7105/world.topo.bathy.200406.3x5400x2700.jpg
	[ ! -f ${XPLANET_WORLD_DIR}/07.jpg ] && wget -O ${XPLANET_WORLD_DIR}/07.jpg ${SERVERURI}/7106/world.topo.bathy.200407.3x5400x2700.jpg
	[ ! -f ${XPLANET_WORLD_DIR}/08.jpg ] && wget -O ${XPLANET_WORLD_DIR}/08.jpg ${SERVERURI}/7107/world.topo.bathy.200408.3x5400x2700.jpg
	[ ! -f ${XPLANET_WORLD_DIR}/09.jpg ] && wget -O ${XPLANET_WORLD_DIR}/09.jpg ${SERVERURI}/7108/world.topo.bathy.200409.3x5400x2700.jpg
	[ ! -f ${XPLANET_WORLD_DIR}/10.jpg ] && wget -O ${XPLANET_WORLD_DIR}/10.jpg ${SERVERURI}/7109/world.topo.bathy.200410.3x5400x2700.jpg
	[ ! -f ${XPLANET_WORLD_DIR}/11.jpg ] && wget -O ${XPLANET_WORLD_DIR}/11.jpg ${SERVERURI}/7110/world.topo.bathy.200411.3x5400x2700.jpg
	[ ! -f ${XPLANET_WORLD_DIR}/12.jpg ] && wget -O ${XPLANET_WORLD_DIR}/12.jpg ${SERVERURI}/7111/world.topo.bathy.200412.3x5400x2700.jpg

	[ ! -f ${XPLANET_WORLD_DIR}/bump.jpg ] && wget -O ${XPLANET_WORLD_DIR}/bump.jpg ${SERVERURI}/8391/srtm_ramp2.world.5400x2700.jpg
	[ ! -f ${XPLANET_WORLD_DIR}/specular.jpg ] && wget -O ${XPLANET_WORLD_DIR}/specular.jpg ${SERVERURI}/8392/gebco_bathy.5400x2700.jpg
	
	[ ! -f ${XPLANET_WORLD_DIR}/night_jk.jpg ] && wget -O ${XPLANET_WORLD_DIR}/night_jk.jpg http://xplanet.sourceforge.net/Extras/night_jk.jpg
	##the above night picture is only 2048x.. :(

	echo "Processing images..."
	[ ! -f ${XPLANET_IMAGES_DIR}/earth_01.jpg ] && $convert ${XPLANET_WORLD_DIR}/01.jpg $convert_opts ${XPLANET_IMAGES_DIR}/earth_01.jpg
	[ ! -f ${XPLANET_IMAGES_DIR}/earth_02.jpg ] && $convert ${XPLANET_WORLD_DIR}/02.jpg $convert_opts ${XPLANET_IMAGES_DIR}/earth_02.jpg
	[ ! -f ${XPLANET_IMAGES_DIR}/earth_03.jpg ] && $convert ${XPLANET_WORLD_DIR}/03.jpg $convert_opts ${XPLANET_IMAGES_DIR}/earth_03.jpg
	[ ! -f ${XPLANET_IMAGES_DIR}/earth_04.jpg ] && $convert ${XPLANET_WORLD_DIR}/04.jpg $convert_opts ${XPLANET_IMAGES_DIR}/earth_04.jpg
	[ ! -f ${XPLANET_IMAGES_DIR}/earth_05.jpg ] && $convert ${XPLANET_WORLD_DIR}/05.jpg $convert_opts ${XPLANET_IMAGES_DIR}/earth_05.jpg
	[ ! -f ${XPLANET_IMAGES_DIR}/earth_06.jpg ] && $convert ${XPLANET_WORLD_DIR}/06.jpg $convert_opts ${XPLANET_IMAGES_DIR}/earth_06.jpg
	[ ! -f ${XPLANET_IMAGES_DIR}/earth_07.jpg ] && $convert ${XPLANET_WORLD_DIR}/07.jpg $convert_opts ${XPLANET_IMAGES_DIR}/earth_07.jpg
	[ ! -f ${XPLANET_IMAGES_DIR}/earth_08.jpg ] && $convert ${XPLANET_WORLD_DIR}/08.jpg $convert_opts ${XPLANET_IMAGES_DIR}/earth_08.jpg
	[ ! -f ${XPLANET_IMAGES_DIR}/earth_09.jpg ] && $convert ${XPLANET_WORLD_DIR}/09.jpg $convert_opts ${XPLANET_IMAGES_DIR}/earth_09.jpg
	[ ! -f ${XPLANET_IMAGES_DIR}/earth_10.jpg ] && $convert ${XPLANET_WORLD_DIR}/10.jpg $convert_opts ${XPLANET_IMAGES_DIR}/earth_10.jpg
	[ ! -f ${XPLANET_IMAGES_DIR}/earth_11.jpg ] && $convert ${XPLANET_WORLD_DIR}/11.jpg $convert_opts ${XPLANET_IMAGES_DIR}/earth_11.jpg
	[ ! -f ${XPLANET_IMAGES_DIR}/earth_12.jpg ] && $convert ${XPLANET_WORLD_DIR}/12.jpg $convert_opts5 ${XPLANET_IMAGES_DIR}/earth_12.jpg
	[ ! -f ${XPLANET_IMAGES_DIR}/earth_bump.jpg ] && $convert ${XPLANET_WORLD_DIR}/bump.jpg $convert_opts ${XPLANET_IMAGES_DIR}/earth_bump.jpg
	[ ! -f ${XPLANET_IMAGES_DIR}/earth_spec.jpg ] && $convert ${XPLANET_WORLD_DIR}/specular.jpg $convert_opts ${XPLANET_IMAGES_DIR}/earth_spec.jpg

	[ ! -f ${XPLANET_IMAGES_DIR}/earth_night_jk.jpg ] && cp ${XPLANET_WORLD_DIR}/night_jk.jpg ${XPLANET_IMAGES_DIR}/earth_night_jk.jpg

	echo "**************"
	echo "**Completed!**"
	echo "**************"

	echo "Consider adding ${HOME}/.xplanet/xplanet-gnome2.sh to your crontab."
else
	echo "Server was not reachable, try again later..."
fi

