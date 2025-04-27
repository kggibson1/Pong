extends CharacterBody2D # this is the node that the script will extend

var speed = 400 # speed of the ping pong ball

## GDscript has two types of functions, regular like Python where functions are created and called,
## inbuilt functions where the function is created but Godot will call it for you at specific times,
## e.g ready function - executed when a scene is ready, _process if executed at every frame but not 
## designed for physics interactions, _physics_process is the same but used for physics interactions
