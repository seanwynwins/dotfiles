#!/bin/sh

# This allows you to control which image to init the daemon with according
# to the time of day. You may change the match cases as you see fit.
# This currently only takes hours into account, but it should be easy to
# modify to also use minutes, or days of the week, if you want.
#
# Use it simply by calling this script instead of swww-daemon

case $(date +%H) in
	00 | 01 | 02) # First 8 hours of the day
		# Uncomment below to setup the image you wish to display as your
		# wallpaper if you run this script during the first 8 hours of the
		# day

		swww-daemon && swww img /usr/share/sunpaper/images/Corporate-Synergy/1.jpg
		;;
	03 | 04 | 05)
		swww-daemon && swww img /usr/share/sunpaper/images/Corporate-Synergy/2.jpg
		;;
	06 | 07 | 08)
		swww-daemon && swww img /usr/share/sunpaper/images/Corporate-Synergy/3.jpg
		;;
	09 | 10 | 11)
		swww-daemon && swww img /usr/share/sunpaper/images/Corporate-Synergy/4.jpg
		;;
	12 | 13 | 14)
		swww-daemon && swww img /usr/share/sunpaper/images/Corporate-Synergy/5.jpg
		;;
	15 | 16 | 17)
		swww-daemon && swww img /usr/share/sunpaper/images/Corporate-Synergy/6.jpg
		;;
	18 | 19 | 20)
		swww-daemon && swww img /usr/share/sunpaper/images/Corporate-Synergy/7.jpg
		;;
	21 | 22 | 23)
		swww-daemon && swww img /usr/share/sunpaper/images/Corporate-Synergy/8.jpg
		;;
esac
