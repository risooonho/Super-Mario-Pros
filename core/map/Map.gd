extends Node
class_name Map


func _handle_died(monster_position):
	SFX.play("res://core/sounds/kill_monster.wav")