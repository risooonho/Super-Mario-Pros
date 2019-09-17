extends KinematicBody2D


# Private variables
var direction = Vector2()
var max_speed = 2


func _input(event):
	direction.x = event.is_action_pressed() - event.is_action_pressed()

func _process(delta):
	move_and_collide(direction * max_speed * delta)