extends "res://core/character/Character.gd"


# Signals
signal died(position)


# Public variables



# Private variables



func _ready():
	direction = Vector2.LEFT
	speed = 20.0


func _physics_process(delta):
	velocity = move_and_slide(velocity, Vector2.UP)
	
	var collision
	
	for i in get_slide_count():
		collision = get_slide_collision(i)
		handle_collision(collision)


func handle_collision(collision):
	if collision != null:
		if collision.collider != null:
			if collision.collider is preload("res://core/character/mario/Mario.gd") and collision.normal.x != 0:
				collision.collider.queue_free()
			elif collision.normal in [Vector2.LEFT, Vector2.RIGHT]:
				direction.x = -direction.x
			else:
				if collision.normal == Vector2.DOWN:
					emit_signal("died", global_position)
					queue_free()