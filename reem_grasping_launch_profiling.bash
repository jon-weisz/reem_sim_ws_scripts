#!/bin/bash
killall -9 gzserver
killall -9 gzclient
killall -9 python
source devel/setup.bash


#rosrun node_manager_fkie node_manager
roslaunch reem_gazebo reem_gazebo.launch world:=objects_on_table robot:=rgbd &
if [[ ! "$PATH" =~ "*profiling_launcher*" ]]; then
    echo "Adding profiler to path"
    PATH=/home/jweisz/bmark_workspaces/profiling_launcher_ws/bin:$PATH
    PYTHONPATH=/home/jweisz/bmark_workspaces/profiling_launcher_ws/devel/lib/python2.7/dist-packages:$PYTHONPATH
    PKG_CONFIG_PATH=/home/jweisz/bmark_workspaces/profiling_launcher_ws/devel/lib/pkgconfig:$PKG_CONFIG_PATH
    CMAKE_PREFIX_PATH=/home/jweisz/bmark_workspaces/profiling_launcher_ws/devel:$CMAKE_PREFIX_PATH
    CPATH=/home/jweisz/bmark_workspaces/profiling_launcher_ws/devel/include:$CPATH
    ROS_PACKAGE_PATH=/home/jweisz/bmark_workspaces/profiling_launcher_ws/src:$ROS_PACKAGE_PATH
    LD_LIBRARY_PATH=/home/jweisz/bmark_workspaces/profiling_launcher_ws/devel/lib:$LD_LIBRARY_PATH
fi

 sleep 4
roslaunch reem_rgbd_launch simulation_reduce_rate.launch &

 sleep 5
roslaunch reem_tabletop_grasping tabletop_grasping.launch &

 sleep 5
rosrun reem_snippets move_reem_head.py
sleep 2
 #rosrun moveit_grasping_testing pick_and_place.py
 roslaunch reem_tabletop_grasping tabletop_grasping_ork.launch &

 sleep 5
# #rosbag record -a
roslaunch reem_tabletop_grasping tabletop_grasp_testing.launch

#rosrun moveit_grasping_testing pick_a_cluster.py



