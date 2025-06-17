extends Node

func _manage_dialogic_signal(context: Node, data: Dictionary):
	if typeof(data) == TYPE_DICTIONARY:
		if data.has("animation"):
			_play_animation(context, data["animation"])
		if data.has("show_image"):
			_show_image(context, data["show_image"])
		if data.has("hide_image"):
			_hide_image(context, data["hide_image"])
		if data.has("hide_animation"):
			_hide_animation(context, data["hide_animation"])					

func _play_animation(context: Node, signal_name: String):
	var animation =  context.get_node_or_null(signal_name)
	if animation:
		animation.play()
	else:
		print("No animation ", signal_name)

func _show_image(context: Node, image_path: String):
	var texture = context.get_node_or_null(image_path)
	if texture:
		texture.visible = true
	else:
		print("No image ", image_path)	


func _hide_image(context: Node, image_path: String):
	var texture = context.get_node_or_null(image_path)
	if texture:
		texture.visible = false
	else:
		print("No image ", image_path)	

func _hide_animation(context: Node, signal_name: String):
	var animation = context.get_node_or_null(signal_name)
	if animation:
		animation.visible = false
	else:
		print("No animation ", signal_name)	
