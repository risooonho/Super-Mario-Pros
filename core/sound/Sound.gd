extends AudioStreamPlayer


func _on_Sound_finished():
	self.queue_free()