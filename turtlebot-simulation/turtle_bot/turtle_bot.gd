extends VehicleBody3D

const STEER_SPEED = 1.5
const STEER_LIMIT = 1
const BRAKE_STRENGTH = 2.0

@export var engine_force_value := 5.0
@onready var left_wheel = $"Left Wheel"
@onready var right_wheel = $"Right Wheel"

var steer_target := 0.0

func _physics_process(delta: float):
	var fwd_mps := (linear_velocity * transform.basis).x

	if Input.is_action_pressed("rotate_right"):
		right_wheel.engine_force = 1 * delta
		left_wheel.engine_force = -1 * delta
	
	if Input.is_action_pressed("rotate_left"):
		right_wheel.engine_force = -1 * delta
		left_wheel.engine_force = 1 * delta
	
	right_wheel.engine_force = Input.get_axis("move_backward", "move_forward") * engine_force_value
	left_wheel.engine_force = Input.get_axis("move_backward", "move_forward") * engine_force_value
