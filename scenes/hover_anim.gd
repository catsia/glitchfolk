extends AnimatedSprite2D

@export var button: TextureButton

func _ready():
	if button:
		button.mouse_entered.connect(_hover.bind(true))
		button.mouse_exited.connect(_hover.bind(false))

func _hover(show: bool):
	visible = show

	play() if show else stop()
