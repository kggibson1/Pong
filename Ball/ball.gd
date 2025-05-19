extends CharacterBody2D # add to the ball scene

var speed = 600 # speed of the ball
#var velocity = Vector2.ZERO # vector that doesnt point in any direction, dont need to set as the CharacterBody2D already has this feature, it is editied with the move_and_slide function

## only going to run once when the ball scene is ready. Underline means that functions are not directly called
## by a user, but called at specific points in a game process by godot.
func _ready():
	# have a new seed generated for each new scene ready (not sure if this is needed in the newer versions)
	randomize()
	
	# randomising the velocity of the ball
	velocity.x = [-1,1][randi() % 2] # give a random number between -1 and 1, [randi() % 2] generates random number between 0 and 1, randi() generates int over infinite range, % 2 limits this to 0 and 1
	
	# make ball move faster in the horizontal direction than the vertical direction
	velocity.y = [-0.9, 0.9][randi() % 2]

func _physics_process(delta):
	# update the balls position each from, 
	var collision_object = move_and_collide(velocity*speed*delta)
	
	# if a collision has occured
	if collision_object:
		velocity = velocity.bounce(collision_object.get_normal())
		

## stops the ball
func stop_ball():
	speed = 0
