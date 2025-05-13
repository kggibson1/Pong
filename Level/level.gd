extends Node

## signal to trigger if a body enters the left node (Area2D physics node)
func _on_left_wall_body_entered(body: Node2D):
	#print('Collision_test')
	
	# get the screen and its size
	var screensize = get_viewport().size
	
	# Calculate the center coordinates
	var screen_center_x = screensize.x / 2
	var screen_center_y = screensize.y / 2
	
	# $Ball only targets the ball
	$Ball.position = Vector2(screen_center_x, screen_center_y)


func _on_right_wall_body_entered(body: Node2D):
		# get the screen and its size
	var screensize = get_viewport().size
	
	# Calculate the center coordinates
	var screen_center_x = screensize.x / 2
	var screen_center_y = screensize.y / 2
	
	# $Ball only targets the ball
	$Ball.position = Vector2(screen_center_x, screen_center_y)
