extends VehicleBody3D

@export var engine_force_value := 5.0
@onready var left_wheel = $"Left Wheel"
@onready var right_wheel = $"Right Wheel"
@onready var front_wheel = $"Front Wheel"

var left = 0
var right = 0
var right_rotate = 0
var left_rotate = 0

func _physics_process(delta: float):
	if Input.is_action_pressed("move_forward"):
		left = Input.get_action_strength("move_forward")
		right = Input.get_action_strength("move_forward")
	if Input.is_action_pressed("move_backward"):
		left = Input.get_action_strength("move_backward")
		right = Input.get_action_strength("move_backward")
	if Input.is_action_pressed("rotate_left"):
		left = -Input.get_action_strength("rotate_left")
		right = 1
	if Input.is_action_pressed("rotate_right"):
		right = -Input.get_action_strength("rotate_right")
		left = 1
	left_wheel.engine_force = left * engine_force_value
	right_wheel.engine_force = right * engine_force_value
	left = left_wheel.brake
	right = right_wheel.brake
