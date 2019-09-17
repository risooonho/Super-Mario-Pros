extends "res://core/character/Character.gd"


# Public variables
export(float) var speed = 64
export(float) var jump_height = 64


# Private variables
var speed_x = 0
var speed_y = 0

var gravity = MIN_GRAVITY
var direction = Vector2()

var jumping = false


# Constants
const MIN_GRAVITY = 100.0
const GRAVITY_DIRECTION = Vector2.DOWN


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
		jump()


func jump():
	if not jumping:
		jumping = true
		
		
		jumping = false


func _physics_process(delta):
	var collision = move_and_collide(direction * speed * delta)
	
	if collision:
		if collision.collider is preload("res://core/character/monster/Monster.gd"):
			queue_free()
	
	if not jumping:
		if move_and_collide(gravity * GRAVITY_DIRECTION * delta):
			gravity = MIN_GRAVITY
		else:
			gravity += gravity * GRAVITY_DIRECTION.y * delta


func _process(delta):
	direction.x = int(Input.is_action_pressed("move_right")) - int(Input.is_action_pressed("move_left"))
	
	if global_position.y > 40:
		OS.alert("Game Over!")
		set_process(false)
		get_tree().quit()
	
	if direction.x == 0:
		Sprite.animation = "idle"