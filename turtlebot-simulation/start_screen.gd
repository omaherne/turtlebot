extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
	# Get the StartButton node and connect the "pressed" signal
	var start_button = $StartButton
	start_button.connect("pressed", Callable(self, "_on_StartButton_pressed"))

# Function to load the main game scene when the button is pressed
func _on_StartButton_pressed():
	# You can load your main game scene here
	get_tree().change_scene_to_file("res://levels/level_1.tscn")  # Change to the actual path of your main game scene
