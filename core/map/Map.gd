extends Node


# References
onready var KillAudio = $KillAudio


func _handle_died(monster_position):
	KillAudio.play()