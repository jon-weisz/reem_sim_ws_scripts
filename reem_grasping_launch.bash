
killall roslaunch
killall -9 python
killall rosmaster
killall -9 gzserver
killall -9 gzclient
killall rviz



pushd ~/Dev/reem_sim_ws
source devel/setup.bash
popd

roslaunch reem_tabletop_grasping reem_simulation.launch &
sleep 60 &

#Look down again

sleep 10

rosrun reem_snippets move_reem_head.py
sleep 5
rosparam set /move_group/trajectory_execution/execution_duration_monitoring False
sleep 5
rosrun moveit_grasping_testing pick_as_moveit.py /grasp_generator_server/generate:=/moveit_simple_grasps_server/generate 




