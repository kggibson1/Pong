extends CharacterBody2D # this is the node that the script will extend

var speed = 10 # speed of the ping pong ball

## GDscript has two types of functions, regular like Python where functions are created and called,
## inbuilt functions where the function is created but Godot will call it for you at specific times,
## e.g ready function - executed when a scene is ready, _process if executed at every frame but not 
## designed for physics interactions, _physics_process is the same but used for physics interactions

## executes each frame of the game. delta ensures game runs at a consistent speed
## Here we check the player input, store the input and apply it to the paddle player
func _physics_process(_delta: float):
	
	# character 2d has a self property therefore declaring var velocity creates a different local velocity variable
	# without var you are editing the CharacterBody2D.velocity directly?
	velocity = Vector2.ZERO # (0, 0) # This makes me feel like I can create my own game engine
	
	# check if the up key has been pressed, adjust velocity accordingly (BOOLEAN STATEMENT)
	if Input.is_action_pressed('ui_up'): # there must be a better way to do this - this seems to be the most robust way
		velocity.y -= 1 # make the paddle go up	
	
	# check if down key has been pressed
	if Input.is_action_pressed('ui_down'): # avoid elif as both keys could be pressed at the same time?
		velocity.y += 1	
		
	# scale velocity by the speed
	velocity = velocity.normalized()
		
	# now that velocity is adjusted we move the player (paddle) with the new velocity
	move_and_collide(velocity*speed) # not sure why move_and_slide doesnt work - need to look into that
	
	
	
	
