extends RigidBody3D

func _ready() -> void:
	pass

func _physics_process(delta: float) -> void:
	var input := Vector3.ZERO
	input.x = Input.get_axis("rotate_left", "rotate_right") # moves the bot left instead of turning, will get to it later
	input.z = Input.get_axis("move_forward", "move_backward")
	
	apply_central_force(input * 1200.0 * delta)
