extends Node

@onready var fade_rect = get_node("ScreenFade/FadeRect")

func fade_to_black(duration: float = 1.0, on_complete: Callable = Callable()):
	fade_rect.visible = true
	var tween = create_tween()
	tween.tween_property(fade_rect, "modulate:a", 1.0, duration)
	await tween.finished  
	if on_complete != null and on_complete.is_valid():
		on_complete.call()
