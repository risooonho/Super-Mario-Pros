extends "res://core/character/Character.gd"


# Public variables



# Private variables


# Constants
const JUMP_MAX_TIME = .4
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


func _physics_process(delta):
	# Get direction input
	direction.x = int(Input.is_action_pressed("move_right")) - int(Input.is_action_pressed("move_left"))
	
	# Get jump input
	if Input.is_action_pressed("jump") and is_on_floor():
		Sprite.animation = "idle"
		velocity.y = -JUMP_FORCE
	elif Input.is_action_just_released("jump") and velocity.y < -50:
		velocity.y = -64
	
	if direction.x == 0:
		Sprite.animation = "idle"
	
	velocity = move_and_slide(velocity, Vector2.UP)
	
	var collision
	
	for i in get_slide_count():
		collision = get_slide_collision(i)