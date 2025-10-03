extends Node

#var fade_duration = 1.5

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
		if data.has("next_scene"):
			_next_scene(context, data["next_scene"])
		if data.has("set_state"):
			_set_state(context, data["set_state"])	

func _next_scene(context: Node, next_scene: String):
	var path = "res://scenes/" + next_scene + ".tscn"
	context.get_tree().change_scene_to_file(path)

func _set_state(context: Node, argument: String):
	var parts = argument.split("_")
	ImageSceneManager.set_image_state(parts[0], parts[1])

func _play_animation(context: Node, signal_name: String):
	var animation =  context.get_node_or_null(signal_name)
	if animation:
		if animation.has_meta("fade_in"):
			fade_in(context, animation)
		else:
			animation.visible = true
		animation.play()
	else:
		print("No animation ", signal_name)

func _show_image(context: Node, image_path: String):
	var texture = context.get_node_or_null(image_path)
	if texture:
		if texture.has_meta("fade_in"):
			fade_in(context, texture)
		else:
			texture.visible = true
	else:
		print("No image ", image_path)	


func _hide_image(context: Node, image_path: String):
	var texture = context.get_node_or_null(image_path)
	if texture:
		if texture.has_meta("fade_out"):
			fade_out(context, texture)
		else:
			texture.visible = false
	else:
		print("No image ", image_path)	

func _hide_animation(context: Node, signal_name: String):
	var animation = context.get_node_or_null(signal_name)
	if animation:
		if animation.has_meta("fade_out"):
			fade_out(context, animation)
		else:
			animation.visible = false
	else:
		print("No animation ", signal_name)	
		
func _stop_animation(context: Node, signal_name: String):
	var animation = context.get_node_or_null(signal_name)
	if animation:
		animation.stop()
	else:
		print("No animation ", signal_name)	
		
func fade_out(context: Node, item):
	var tween = context.get_tree().create_tween()
	tween.tween_property(item, "modulate:a", 0, item.get_meta("fade_out"))
	tween.play()
	await tween.finished
	tween.kill()

func fade_in(context: Node, item):
	item.modulate.a = 0
	item.visible = true
	var tween = context.get_tree().create_tween()
	tween.tween_property(item, "modulate:a", 1, item.get_meta("fade_in"))
	tween.play()
	await tween.finished
	tween.kill()
