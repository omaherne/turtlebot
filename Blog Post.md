# Simulating a TurtleBot in a Maze

Overall, this project was extremely fun and rewarding. We got a chance to work as a team, and work with a 
company that we all thought was extremely cool and exciting! Working with Neuraville has been a blast, 
and we can’t thank them enough for all of their guidance and support. 

This project was built almost entirely in the Godot Game Engine, which was very unfamiliar to us. 
We spent the first week or so going through documentation and youtube tutorials to get an idea of how we were
going to be able to accomplish this task. We started by creating a simple TurtleBot (literally just a cylinder) 
that had the controls of going forward, back, left, and right. We then added in a ground and our first maze design!



We added in some basic wood textures (which were later removed so the bot functioned better with FEAGI), and we 
had ourselves a game. But this iteration had a lot of shortcomings. First off, we wanted to change the bot to 
actually use wheels to power the movement instead of a floating disc. To do this we used a VehicleBody3D node 
(instead of a RigidBody3D like we were previously using). The VehicleBody3D allowed us to use VehicleWheel3D nodes, 
which we powered using the keyboard so it functioned virtually the same, but with some added realism. This came
with some other issues including the balance and speed of the bot needing to be adjusted. To get around these,
we first added a third wheel to help the bot balance a lot better, as well as changing the movement controls so 
the bot turned to the left and right instead of shifting. This made the bot even more similar to the real-life 
version of a TurtleBot. 


We had also completed all of the levels, and the code to go to the next level after finishing one. We then added
a simple timer for each level, and some nice lighting, colors, and shaders to make the game more appealing to 
the eye and easier to play. After all of this there were only a few more tweaks that needed to be made. The 
first was added some basic distance sensors to the bot so it can know when it is getting close to a wall. We 
send this information to FEAGI, and it is also able to know when the bot is getting close to a wall. We added 
some images of fruit along the maze so that FEAGI (and the user) is able to learn where in the maze it is, and 
where it has been before. And that marks the end of our work with Godot!


We then proceeded to make some very simple Genomes in the Neurorobotics Studio so we can play the game fully
with FEAGI. Since our code used Godot’s input map, the connection with FEAGI was really simple. 

# Future Work

In the future we hope that the bot will be able to complete the maze all on its own, and learn the different 
maze patterns so that it can do the mazes in the most efficient way possible. The bot can learn it’s surroundings 
and not only be able to detect if it’s getting close to the wall, but also avoid any obstacles in the path of the bot. 
One cool thing we also want to be included in the future is the ability for the bot to be controlled using some 
kind of gesture recognition. For instance: If someone standing in front of the bot wanted the bot to do a spin, 
they could hold up a single finger, the bot would recognize that, and do the action. The possibilities for this 
are endless, and we are so excited to see what the future brings for this TurtleBot!

-- Owen Aherne, Andrew Amilcar, and Xiaocheng Ma
