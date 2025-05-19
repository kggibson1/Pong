extends Node

# keep track of score
var player_score = 0
var opponent_score = 0

## signal to trigger if a body enters the left node (Area2D physics node)
func _on_left_wall_body_entered(body: Node2D):
	
		# opponent gets +1 score
	opponent_score += 1
	
	#print('Collision_test')
	
	# get the screen and its size
	var screensize = get_viewport().size
	
	# Calculate the center coordinates
	var screen_center_x = screensize.x / 2
	var screen_center_y = screensize.y / 2
	
	# $Ball only targets the ball
	$Ball.position = Vector2(screen_center_x, screen_center_y)
	
	# set ball velocity to zero from the ball node
	get_tree().call_group('BallGroup', 'stop_ball')
	
	# start countdown timer
	$CountDownTimer.start()


func _on_right_wall_body_entered(body: Node2D):
	
	# player gets +1 score
	player_score += 1
	
		# get the screen and its size
	var screensize = get_viewport().size
	
	# Calculate the center coordinates
	var screen_center_x = screensize.x / 2
	var screen_center_y = screensize.y / 2
	
	# $Ball only targets the ball
	$Ball.position = Vector2(screen_center_x, screen_center_y)
	
	# set ball velocity to zero from the ball node
	get_tree().call_group('BallGroup', 'stop_ball') # group we are calling and the method within the group
	
	# start countdown timer
	$CountDownTimer.start()

func _process(delta):
	$PlayerScore.text = str(player_score)
	$OpponentScore.text = str(opponent_score)
	
	# set text of countdown timer
	$CountDownLabel.text = str(int($CountDownTimer.time_left) + 1)

	
## signal for when timer runs out (reaches 0), countdown for game to start btw
func _on_count_down_timer_timeout():
	# want to tell ball not to move until this has triggered after a level reset
	
	# reset balls velocity
	get_tree().call_group('BallGroup', 'start_ball')
