extends CharacterBody2D # add to the ball scene

var speed = 600 # speed of the ball
#var velocity = Vector2.ZERO # vector that doesnt point in any direction, dont need to set as the CharacterBody2D already has this feature, it is editied with the move_and_slide function

func _ready():
	# only going to run once when the ball scene is ready
	velocity.x = [-1,1][randi() % 2]
