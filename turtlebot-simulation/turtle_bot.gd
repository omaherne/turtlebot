extends RigidBody3D

var mouse_sensitivity := 0.001
var twist_input := 0.0
var pitch_input := 0.0

@onready var twist_pivot := $TwistPivot
@onready var pitch_pivot := $TwistPivot/PitchPivot

func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
#hello owen

# Define the target position for teleportation
var target_position := Vector3(20.5, 0, 4.0)  # Change these values as needed
var teleport_scene := "res://level2.tscn"  # Path to the scene you want to teleport to

func _physics_process(delta: float) -> void:
	var input := Vector3.ZERO
	input.x = Input.get_axis("move_left", "move_right") # moves the bot left instead of turning, will get to it later
	input.z = Input.get_axis("move_forward", "move_backward")
	
	apply_central_force(twist_pivot.basis * input * 1200.0 * delta) # basis aligns with camera so the player moves relative to camera perspective
	
	if global_transform.origin.distance_to(target_position) < 1.25:
		get_tree().change_scene_to_file("res://level2.tscn")
	
	if Input.is_action_just_pressed("ui_cancel"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		
	twist_pivot.rotate_y(twist_input)
	pitch_pivot.rotate_x(pitch_input)
	pitch_pivot.rotation.x = clamp(pitch_pivot.rotation.x, deg_to_rad(-30), deg_to_rad(30)) # keeps the camera from going below the bot (30 degrees)
	twist_input = 0.0
	pitch_input = 0.0

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		if Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
			twist_input = - event.relative.x * mouse_sensitivity
			pitch_input = - event.relative.y * mouse_sensitivity
