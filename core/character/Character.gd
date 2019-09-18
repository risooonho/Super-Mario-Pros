extends KinematicBody2D


# Public variables
export(float) var speed = 50


# Private variables
var speed_x = 0
var speed_y = 0
var direction = Vector2()


# Constants
const GRAVITY = 512


func _ready():
	pass


func _physics_process(delta):
	# Gravity force
	direction.y = speed_y * delta
	speed_y += GRAVITY * delta