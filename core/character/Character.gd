extends KinematicBody2D


# Public variables
export(float) var speed = 50


# Private variables
var direction = Vector2.RIGHT
var velocity = Vector2()


# Constants
const GRAVITY = 512


func _physics_process(delta):
	# Gravity force
	velocity.y += GRAVITY * delta
	
	velocity.x = direction.x * speed
