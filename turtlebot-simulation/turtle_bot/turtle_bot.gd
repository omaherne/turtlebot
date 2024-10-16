extends RigidBody3D

var velocity := 100
var rotate_value := 0.75

@onready var twist_pivot := $TwistPivot
@onready var pitch_pivot := $TwistPivot/PitchPivot

func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _physics_process(delta: float) -> void:
	var input_direction = Vector3.ZERO
	var input_rotate
	input_direction.z = Input.get_axis("move_backward", "move_forward") # -1 for backwards, 1 for forwards
	input_rotate = Input.get_axis("rotate_right", "rotate_left") # -1 for right, 1 for left
	
	apply_force(input_direction * 1200.0 * delta)
	rotate_y(input_rotate * rotate_value * delta)
	
	if Input.is_action_just_pressed("ui_cancel"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
