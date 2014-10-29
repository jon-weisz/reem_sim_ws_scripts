source devel/setup.bash
killall roslaunch
killall -9 python
killall rosmaster
killall -9 gzserver
killall -9 gzclient


roslaunch reem_2dnav_gazebo reem_navigation.launch &
sleep 30
python ./reem_send_goal.py -f ./reem_goal1.yaml -w 30 -t /move_base_simple/goal -r /move_base/result

python ./reem_send_goal.py -f ./reem_goal2.yaml -w 30 -t /move_base_simple/goal -r /move_base/result


