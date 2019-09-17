extends "res://core/character/Character.gd"


# Public variables



# Private variables
var direction = Vector2.LEFT


func _ready():
	speed = 20.0


func _physics_process(delta):
	var collision = move_and_collide(direction * speed * delta)

	if collision:
		direction.x = -direction.x