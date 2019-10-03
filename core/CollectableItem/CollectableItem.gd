extends Area2D
class_name CollectableItem


# Signals
signal collected


# Public variables
export(NodePath) var Map_path

onready var Map = get_node(Map_path)


func _on_CollectableItem_body_entered(body):
	if body is Mario:
		emit_signal("collected")
		self.queue_free()