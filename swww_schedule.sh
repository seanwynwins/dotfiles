#!/bin/sh
# NOTE: the above line is really the only one that matters, so if you are
# making a script and want to schedule a bunch of things at once, I recommend
# creating a function, like:
#
swww_schedule() {
     echo "swww img $1" | at "$2"
}
#
# Then, you can simply call:
#     swww_schedule <path/to/img> <HH:MM>
# as many time as you need
swww_schedule /usr/share/sunpaper/images/Corporate-Synergy/1.jpg 00:00
swww_schedule /usr/share/sunpaper/images/Corporate-Synergy/2.jpg 03:00
swww_schedule /usr/share/sunpaper/images/Corporate-Synergy/3.jpg 06:00
swww_schedule /usr/share/sunpaper/images/Corporate-Synergy/4.jpg 09:00
swww_schedule /usr/share/sunpaper/images/Corporate-Synergy/5.jpg 12:00
swww_schedule /usr/share/sunpaper/images/Corporate-Synergy/6.jpg 15:00
swww_schedule /usr/share/sunpaper/images/Corporate-Synergy/7.jpg 18:00
swww_schedule /usr/share/sunpaper/images/Corporate-Synergy/8.jpg 21:00
