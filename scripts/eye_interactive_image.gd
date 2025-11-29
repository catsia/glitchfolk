extends "res://scripts/interactive_image.gd"

@export var eye_button: Button

func _ready():
	visible = false

func set_state(state: String):
	current_state = state

func set_state_and_play(state: String):
	visible = true
	current_state = state
	set_button_activity(state)
	play(state)
	
func set_button_activity(state:String):
	if(state == GlobalVariables.eye_looks_state || state == GlobalVariables.eye_opens_state):
		eye_button.disabled = false
	elif (state == GlobalVariables.eye_closed_state):
		eye_button.disabled = true
