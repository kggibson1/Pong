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
## Logic: Opponent will only adjust position is the ball is close to it, 
## if the ball is sufficiently close the script checks if the ball is above or below the opponent
## if above then the opponent adjusts its y position up, if below then it adjusts the position down
func get_opponent_direction():
	
	# first check if the ball is close enough to the opponent
	if abs(ball.position.y - position.y) > 25:
		
		# check if ball is below opponent
		if ball.position > position.y: return 1
		
		# check if ball is above opponent
		else: return -1
		
	
	
