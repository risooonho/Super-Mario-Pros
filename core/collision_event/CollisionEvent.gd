extends Area2D


# Signals
signal event_triggered


# Private variables
var ColliderObject
var enterBody
var initialized = false


func initialize(_colliderObject, _enterBody):
	self.ColliderObject = _colliderObject
	self.enterBody = _enterBody
	
	if enterBody == true:
		self.connect("body_entered", self, "_on_CollisionEvent_body_entered")
	else:
		self.connect("body_exited", self, "_on_CollisionEvent_body_exited")
	
	self.initialized = true


func trigger_event():
	emit_signal("event_triggered")


func _on_CollisionEvent_body_entered(body):
	if body == ColliderObject:
		trigger_event()


func _on_CollisionEvent_body_exited(body):
	if body == ColliderObject:
		trigger_event()
