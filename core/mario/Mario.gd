extends KinematicBody2D


# Public variables
export(float) var speed = 64


# Private variables
var direction = Vector2()


# References
onready var Sprite = $Sprite


func _input(event):
	if event.is_action_pressed("move_left"):
		Sprite.scale.x = -1
		Sprite.animation = "walking"
	elif event.is_action_pressed("move_right"):
		Sprite.scale.x = 1
		Sprite.animation = "walking"
	elif event.is_action_pressed("jump"):
		pass


func _process(delta):
	direction.x = int(Input.is_action_pressed("move_right")) - int(Input.is_action_pressed("move_left"))
	
	move_and_collide(direction * speed * delta)
	
	if direction.x == 0:
		Sprite.animation = "idle"