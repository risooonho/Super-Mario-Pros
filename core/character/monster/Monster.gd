extends Character


# Signals
signal died(position)


# Public variables
export(NodePath) var Map_path


# Private variables
onready var Map = get_node(Map_path)


func _ready():
	connect("died", Map, "_handle_died")
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
			if collision.collider is preload("res://core/character/mario/Mario.gd"):
				if collision.normal == Vector2.DOWN:
					emit_signal("died", global_position)
					queue_free()
				elif collision.normal.x != 0:
					collision.collider.queue_free()
			elif collision.normal in [Vector2.LEFT, Vector2.RIGHT]:
				direction.x = -direction.x
