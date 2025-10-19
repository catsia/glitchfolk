extends AnimatedSprite2D

var current_state = ""

func _ready():
	visible = false

func set_state(state: String):
	current_state = state

func set_state_and_play(state: String):
	visible = true
	current_state = state
	play(state)
