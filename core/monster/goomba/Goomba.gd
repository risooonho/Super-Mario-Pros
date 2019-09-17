extends "res://core/monster/Monster.gd"


func _physics_process(delta):
	var collision = move_and_collide(direction * speed * delta)
	
	if collision:
		direction.x = -direction.x