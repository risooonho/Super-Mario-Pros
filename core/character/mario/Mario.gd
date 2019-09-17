extends "res://core/character/Character.gd"


# Public variables


# Private variables
var speed_x = 0
var speed_y = 0
var direction = Vector2()


# Constants
const GRAVITY = 512
const GRAVITY_DIRECTION = Vector2.DOWN

const JUMP_FORCE = 256


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
		speed_y = -JUMP_FORCE


func _physics_process(delta):
	# Gravity force
	direction.y = speed_y * delta
	speed_y += GRAVITY * delta
	
	var move_remaining = move_and_slide(direction * speed)
	
	if is_on_wall():
		print(move_remaining)
		
		speed_y = 0


func _process(delta):
	direction.x = int(Input.is_action_pressed("move_right")) - int(Input.is_action_pressed("move_left"))
	
	if direction.x == 0:
		Sprite.animation = "idle"