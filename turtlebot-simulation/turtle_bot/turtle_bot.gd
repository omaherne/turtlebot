extends VehicleBody3D

@export var engine_force_value := 10.0
@export var turn_speed := 0.75
@export var brake_strength = 0.08
@onready var left_wheel = $"Left Wheel"
@onready var right_wheel = $"Right Wheel"

func _physics_process(delta: float):
	left_wheel.set_brake(0.06)
	right_wheel.set_brake(0.06)
	
	if (Input.is_anything_pressed() == false):
		left_wheel.engine_force = 0
		right_wheel.engine_force = 0
		left_wheel.brake
		right_wheel.brake
	
	# forward
	if Input.is_action_pressed("move_forward"):
		left_wheel.engine_force = Input.get_action_strength("move_forward") * engine_force_value
		right_wheel.engine_force = Input.get_action_strength("move_forward") * engine_force_value
	
	# backward
	if Input.is_action_pressed("move_backward"):
		left_wheel.engine_force = -Input.get_action_strength("move_backward") * engine_force_value
		right_wheel.engine_force = -Input.get_action_strength("move_backward") * engine_force_value
	
	# forward and right
	if Input.is_action_pressed("rotate_right") and Input.is_action_pressed("move_forward"):
		left_wheel.engine_force = Input.get_action_strength("rotate_right") * engine_force_value
		right_wheel.engine_force = Input.get_action_strength("rotate_right") * 0.4 * engine_force_value
	
	# backward and right
	elif Input.is_action_pressed("rotate_right") and Input.is_action_pressed("move_backward"):
		left_wheel.engine_force = -Input.get_action_strength("rotate_right") * engine_force_value
		right_wheel.engine_force = -Input.get_action_strength("rotate_right") * 0.4 * engine_force_value
	
	# right
	elif Input.is_action_pressed("rotate_right"):
		left_wheel.engine_force = Input.get_action_strength("rotate_right") * turn_speed * engine_force_value
		right_wheel.engine_force = -Input.get_action_strength("rotate_right") * turn_speed * engine_force_value
	
	# forward and left
	if Input.is_action_pressed("rotate_left") and Input.is_action_pressed("move_forward"):
		left_wheel.engine_force = Input.get_action_strength("rotate_left") * 0.4 * engine_force_value
		right_wheel.engine_force = Input.get_action_strength("rotate_left") * engine_force_value
	
	# backward and left
	elif Input.is_action_pressed("rotate_left") and Input.is_action_pressed("move_backward"):
		left_wheel.engine_force = -Input.get_action_strength("rotate_left") * 0.4 * engine_force_value
		right_wheel.engine_force = -Input.get_action_strength("rotate_left") * engine_force_value
	
	# left
	elif Input.is_action_pressed("rotate_left"):
		left_wheel.engine_force = -Input.get_action_strength("rotate_left") * turn_speed * engine_force_value
		right_wheel.engine_force = Input.get_action_strength("rotate_left") * turn_speed * engine_force_value
