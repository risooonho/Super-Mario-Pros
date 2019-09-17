extends KinematicBody2D


# Private variables
var direction = Vector2()
var max_speed = 25


func _process(delta):
	direction.x = int(Input.is_action_pressed("move_right")) - int(Input.is_action_pressed("move_left"))
	
	move_and_collide(direction * max_speed * delta)