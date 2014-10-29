#!/bin/bash
bash kill_all.bash
source devel/setup.bash

sudo operf --system-wide --separate-thread --lazy-conversion -g&
roslaunch reem_tabletop_grasping reem_simulation.launch &
sleep 60 &

#Look down again
bash ./reem_grasping_launch.bash

sudo killall operf -s SIGINT

#oparchive -o /tmp/reem_grasping_profile
