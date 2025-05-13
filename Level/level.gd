extends Node

## signal to trigger if a body enters the left node (Area2D physics node)
func _on_left_wall_body_entered(body: Node2D):
	print('Collision_test')
