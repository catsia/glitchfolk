extends Node2D

func show_image(image_id: String):
	var image_node = get_node_or_null(image_id)
	if image_node:
		image_node.visible = true

func hide_image(image_id: String):
	var image_node = get_node_or_null(image_id)
	if image_node:
		image_node.visible = false

func set_image_state(image_id: String, state: String):
	var image_node = get_node_or_null(image_id)
	if image_node and image_node.has_method("set_state"):
		image_node.set_state(state)
