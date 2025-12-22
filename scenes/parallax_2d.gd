extends Parallax2D

func _process(delta):
	var mouse_pos = get_global_mouse_position()
	var screen_center = get_viewport_rect().size / 2
	var offset = (mouse_pos - screen_center) * 0.08
	scroll_offset = offset
