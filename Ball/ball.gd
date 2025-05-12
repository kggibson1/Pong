extends CharacterBody2D # add to the ball scene

var speed = 600 # speed of the ball
#var velocity = Vector2.ZERO # vector that doesnt point in any direction, dont need to set as the CharacterBody2D already has this feature, it is editied with the move_and_slide function

## only going to run once when the ball scene is ready
func _ready():
	
	# randomising the velocity of the ball
	velocity.x = [-1,1][randi() % 2] # give a random number between -1 and 1, [randi() % 2] generates random number between 0 and 1, randi() generates int over infinite range, % 2 limits this to 0 and 1
	
	# make ball move faster in the horizontal direction than the vertical direction
	velocity.y = [-0.8, 0.8][randi() % 2]
