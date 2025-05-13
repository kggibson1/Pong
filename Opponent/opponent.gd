extends CharacterBody2D

var speed = 250 # opponent speed
var ball

func _ready():
	# when the ball scene is ready, it looks for its parent (level node)
	
	# when the level scene is ready, find the parent scene of opponent, and find a node within it called 'Ball'
	ball = get_parent().find_node('Ball') # essentially gives access to all of the balls attributes?
	
func _physics_process(delta):
	move_and_slide()
	
## Function needs to be called to be used as doesnt have _	
func get_opponent_direction():
	pass
	
	
