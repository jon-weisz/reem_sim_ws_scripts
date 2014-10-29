<h1>Scripts for running and profiling simple REEM simulations of grasping and manipulation</h1>

<h2>Manipulation</h2>
To run the manipulation task, run
```
bash reem_grasping_launch.bash
```
To run it with the profiler running, do it like this:
```
reem_grasping_launch_oprofiling.bash
```

<h3>Notes</h3>
Right now, the manipulation script requires some use input to simply accept an option. It also fails to actually grasp the object.


<h2>Navigation</h2>
To run the navigation task, run
```
bash reem_navigation_launch.bash
```
To run it with the profiler running, do it like this:
```
reem_navigation_launch_oprofiling.bash
```

This will cause the robot to navigate from one room to another and then back. 

The profiler will only launch after the gazebo world loads.
