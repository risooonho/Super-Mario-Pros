extends Node2D


# Public variables
export(NodePath) var Rect_path


# Private variables
var enabled = false
var blur_amount = .0

onready var Rect = get_node(Rect_path)


func enable():
	set_process_unhandled_input(false)
	set_process(true)
	
	var tween = Tween.new()
	add_child(tween)
	
	tween.interpolate_property(self, "blur_amount", 0, 5.0, 5, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	tween.start()
	
	yield(tween, "tween_completed")
	tween.queue_free()
	
	set_process(false)
	set_process_unhandled_input(true)
	enabled = true


func disable():
	set_process_unhandled_input(false)
	set_process(true)
	
	var tween = Tween.new()
	add_child(tween)
	
	tween.interpolate_property(self, "blur_amount", 5.0, .0, .5, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	tween.start()
	
	yield(tween, "tween_completed")
	tween.queue_free()
	
	set_process(false)
	set_process_unhandled_input(true)
	enabled = false


func _process(delta):
	Rect.material.set_shader_param("amount", blur_amount)


func _unhandled_input(event):
	if event.is_action_pressed("menu"):
		if enabled:
			disable()
		else:
			enable()
