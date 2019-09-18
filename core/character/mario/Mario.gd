extends "res://core/character/Character.gd"


# Public variables



# Private variables
var jumping = false


# Constants
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
		if not jumping:
			jumping = true
			speed_y = -JUMP_FORCE


func _process(delta):
	direction.x = int(Input.is_action_pressed("move_right")) - int(Input.is_action_pressed("move_left"))
	
	if direction.x == 0:
		Sprite.animation = "idle"


func _physics_process(delta):
	move_and_slide(direction * speed)
	
	if is_on_wall():
		speed_y = 0
		jumping = false
	
	var collision
	
	for i in get_slide_count():
		collision = get_slide_collision(i)
	
	if collision != null:
		pass