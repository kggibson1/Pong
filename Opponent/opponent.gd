extends CharacterBody2D

var speed = 250 # opponent speed
var ball

func _ready():
	# when the ball scene is ready, it looks for its parent (level node)
	
	# when the level scene is ready, find the parent scene of opponent, and find a node within it called 'Ball'
	ball = get_parent().get_node('Ball') # essentially gives access to all of the balls attributes?
	
func _physics_process(delta):
	#move_and_collide(Vector2(0, get_opponent_direction())*speed)
	
	var direction = Vector2(0, get_opponent_direction()) * speed
	
	move_and_collide(direction*delta)
	
## Function needs to be called to be used as doesnt have _
## Logic: Opponent will only adjust position is the ball is close to it, 
## if the ball is sufficiently close the script checks if the ball is above or below the opponent
## if above then the opponent adjusts its y position up, if below then it adjusts the position down
## 1 means the ball is below opponent, -1 means above opponent, 0 means the ball isnt close to the 
## opponent
func get_opponent_direction():
	
	# first check if the ball is close enough to the opponent
	if abs(ball.position.y - position.y) > 10:
		
		# check if ball is below opponent
		if ball.position.y > position.y: return 1
		
		# check if ball is above opponent
		else: return -1
		
	else: return 0 # return 0 if the ball isnt close to the opponent
		
	
	
