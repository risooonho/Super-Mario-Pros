extends KinematicBody2D


# Private variables
var direction = Vector2()
var max_speed = 25


# References
onready var Sprite = $Sprite


func _input(event):
	if event.is_action_pressed("move_left"):
		Sprite.scale.x = -1
		Sprite.animation = "walking"
	elif event.is_action_pressed("move_right"):
		Sprite.scale.x = 1
		Sprite.animation = "walking"


func _process(delta):
	direction.x = int(Input.is_action_pressed("move_right")) - int(Input.is_action_pressed("move_left"))
	
	move_and_collide(direction * max_speed * delta)
	
	if direction.x == 0:
		Sprite.animation = "idle"