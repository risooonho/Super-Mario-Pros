extends Node


var Sound = preload("res://core/sound/Sound.tscn")


func play(sound_path):
	var sound = Sound.instance()
	sound.stream = load(sound_path)
	add_child(sound)