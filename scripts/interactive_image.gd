extends AnimatedSprite2D

#@export var image_id: String = ""

func _ready():
	visible = false

func set_state(state: String):
	visible = true
	play(state)
