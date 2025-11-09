extends "res://scripts/interactive_image.gd"

func _ready():
	visible = false

func set_state(state: String):
	current_state = state

func set_state_and_play(state: String):
	visible = true
	current_state = state
	play(state)
