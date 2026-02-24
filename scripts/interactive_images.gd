extends Node2D

func get_canvas_layer() -> CanvasLayer:
	return get_node_or_null("CanvasLayer")

func get_image(image_id) -> AnimatedSprite2D:
	return get_node_or_null(image_id)

func show_image(image_id: String, state: String):
	var image_node = get_image(image_id)
	if image_node:
		image_node.visible = true
		set_button_active(image_id)
	if not state.is_empty():
		if image_node and image_node.has_method("set_state"):
			image_node.set_state(state)
		set_static_image_state(state, image_node)

func set_button_active(button_id):
	var canvas_layer = get_canvas_layer()
	if canvas_layer and canvas_layer.has_method("change_button_visibility"):
		canvas_layer.change_button_visibility(button_id, true)

func hide_image(image_id: String):
	var image_node = get_image(image_id)
	if image_node:
		image_node.visible = false

func set_static_image_state(state: String, image: AnimatedSprite2D):
	image.play(state) 
	image.stop() 
	image.frame = image.sprite_frames.get_frame_count(state) - 1

func set_image_state(image_id: String, state: String):
	var image_node = get_image(image_id)
	if image_node and image_node.has_method("set_state"):
		set_button_active(image_id)
		image_node.set_state(state)

func set_image_state_and_play(image_id: String, state: String):
	var image_node = get_image(image_id)
	if image_node:
		set_button_active(image_id)
		image_node.set_state_and_play(state)

func play_idle(image_id: String, state: String):
	var image_node = get_image(image_id)
	if image_node:
		image_node.play("idle_" + state)
		
func is_eye_button_disabled() -> bool:
	return get_canvas_layer().is_eye_button_disabled()

func enable_eye_button():
	return get_canvas_layer().enable_eye_button()
