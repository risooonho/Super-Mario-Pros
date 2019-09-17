extends AudioStreamPlayer


# References
onready var Musics = $Musics


func _ready():
	randomize()
	stream = Musics.get_resource(str(randi()%3))
	play()

func _on_Timer_timeout():
	pass