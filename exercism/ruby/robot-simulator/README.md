# Robot Simulator

Write a robot simulator.

A robot factory's test facility needs a program to verify robot movements.

The robots have three possible movements:

- turn right
- turn left
- advance

Robots are placed on a hypothetical infinite grid, facing a particular
direction (north, east, south, or west) at a set of {x,y} coordinates,
e.g., {3,8}, with coordinates increasing to the north and east.

The robot then receives a number of instructions, at which point the
testing facility verifies the robot's new position, and in which
direction it is pointing.

- The letter-string "RAALAL" means:
  - Turn right (facing east at 7, 3)
  - Advance twice (facing east at 9, 3)
  - Turn left (facing north at 9, 3)
  - Advance once (facing north at 9, 4)
  - Turn left yet again (facing west at 9,4)
- Say a robot starts at {7, 3} facing north. Then running this stream
  of instructions should leave it at {9, 4} facing west.

----

three types of movements a robot can make:  

- turn right
- turn left
- advance

four directions a robot can face:

- north
- east
- south
- west

grid:

- stretching from [0, 0] towards [inf, inf]


----

robot has two attributes:

- direction: north, east, south, west
- location: an [x, y] coordinate pair

- orient is a setter for direction
- rotate_right and rotate_left change the direction
- advance changes location depending on direction:

    - if orientation is :north, then y += 1
    - if orientation is :east, then x += 1
    - if orientation is :south, then y -= 1
    - if orientation is :west, then x -= 1
