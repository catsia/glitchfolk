extends Node2D

func show_image(image_id: String, state: String):
	var image_node = get_node_or_null(image_id)
	if image_node:
		image_node.visible = true
	if not state.is_empty():
		set_static_image_state(state, image_node)

func hide_image(image_id: String):
	var image_node = get_node_or_null(image_id)
	if image_node:
		image_node.visible = false

func set_static_image_state(state: String, image: AnimatedSprite2D):
	image.play(state) 
	image.stop() 
	image.frame = image.sprite_frames.get_frame_count(state) - 1

func set_image_state(image_id: String, state: String):
	var image_node = get_node_or_null(image_id)
	if image_node and image_node.has_method("set_state"):
		image_node.set_state(state)
