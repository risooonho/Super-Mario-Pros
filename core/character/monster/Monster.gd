extends "res://core/character/Character.gd"


# Public variables



# Private variables



func _ready():
	direction = Vector2.LEFT
	speed = 20.0


func _physics_process(delta):
	move_and_slide(direction * speed)
	
	if is_on_wall():
		speed_y = 0
	
	var collision
	
	for i in get_slide_count():
		collision = get_slide_collision(i)
	
	if collision != null:
		if collision.collider != null && collision.normal.y == 0:
			direction.x = -direction.x