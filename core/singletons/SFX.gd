extends Node


var Sound = preload("res://core/sound/Sound.tscn")


func play(sound_path, volume_db):
	var sound = Sound.instance()
	sound.stream = load(sound_path)
	sound.volume_db = volume_db
	add_child(sound)