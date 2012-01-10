#!/usr/bin/python
import dbus

bus = dbus.SessionBus()

try:
	geoclue = bus.get_object('org.freedesktop.Geoclue.Providers.Hostip', 
							   '/org/freedesktop/Geoclue/Providers/Hostip')

	posi = geoclue.GetPosition(dbus_interface='org.freedesktop.Geoclue.Position')

	print posi[2] 
	print posi[3]
except Exception, e:
	print "D-Bus error %s" % e

