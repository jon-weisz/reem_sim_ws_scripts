
killall roslaunch
killall -9 python
killall rosmaster
killall -9 gzserver
killall -9 gzclient
killall rviz
source devel/setup.bash

roslaunch reem_tabletop_grasping reem_simulation.launch &
sleep 60 &

#Look down again

sleep 10

rosrun reem_snippets move_reem_head.py
sleep 5
rosparam set /move_group/trajectory_execution/execution_duration_monitoring False
sleep 5
rosrun moveit_grasping_testing pick_as_moveit.py /grasp_generator_server/generate:=/moveit_simple_grasps_server/generate 



#rosrun node_manager_fkie node_manager
#rosrun node_manager_fkie node_manager
#roslaunch reem_gazebo reem_gazebo.launch world:=objects_on_table robot:=rgbd &
# sleep 30
#roslaunch reem_rgbd_launch simulation_reduce_rate.launch &

#  sleep 30
# roslaunch reem_tabletop_grasping tabletop_grasping.launch &
# sleep 10
# roslaunch reem_moveit_config moveit_rviz.launch config:=true &


#  sleep 20
# rosrun reem_snippets move_reem_head.py
# sleep 20

# #rosrun object_recognition_ros server -c `rospack find reem_object_recognition`/config/tabletop/detection.clusters.ros.ork.reem &
# #sleep 10
# #rosrun object_recognition_core detection -c `rospack find reem_object_recognition`/config/tabletop/detection.clusters.ros.ork.reem.throtled &
# #sleep 10

# rosrun moveit_grasping_testing pick_as_moveit.py /grasp_generator_server/generate:=/moveit_simple_grasps_server/generate

#rosrun moveit_grasping_testing pick_and_place.py

#roslaunch reem_tabletop_grasping tabletop_grasping_ork.launch &

# sleep 20
#rosbag record -a
#roslaunch reem_tabletop_grasping tabletop_grasp_testing.launch

#rosrun moveit_grasping_testing pick_a_cluster.py



