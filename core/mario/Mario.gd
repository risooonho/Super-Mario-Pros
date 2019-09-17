extends KinematicBody2D


# Public variables
export(float) var speed = 64


# Private variables
var gravity = 64
var direction = Vector2()


# Constants
const GRAVITY_DIRECTION = Vector2(0, 1)


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


func _physics_process(delta):
	if move_and_collide(gravity * GRAVITY_DIRECTION * delta):
		gravity = 64
	else:
		gravity += gravity * GRAVITY_DIRECTION.y * delta


func _process(delta):
	direction.x = int(Input.is_action_pressed("move_right")) - int(Input.is_action_pressed("move_left"))
	
	if global_position.y < 40:
		translate(direction * speed * delta)
	else:
		OS.alert("Game Over!")
		set_process(false)
		get_tree().quit()
	
	if direction.x == 0:
		Sprite.animation = "idle"