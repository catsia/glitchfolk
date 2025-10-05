extends AnimatedSprite2D

func _ready():
	visible = false

func set_state(state: String):
	visible = true
	play(state)
