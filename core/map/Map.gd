extends Node
class_name Map


# Public variables
export(NodePath) var KillAudio_path


# Private variables
onready var KillAudio = get_node(KillAudio_path)


func _handle_died(monster_position):
	KillAudio.play()
