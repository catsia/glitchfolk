extends Node

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
	
func show_image(context: Node, image_path: String):
	var texture = context.get_node_or_null(image_path)
	if texture:
		if texture.has_meta("fade_in"):
			fade_in(context, texture)
		else:
			texture.visible = true
	else:
		print("No image ", image_path)	

func hide_image(context: Node, image_path: String):
	var texture = context.get_node_or_null(image_path)
	if texture:
		if texture.has_meta("fade_out"):
			fade_out(context, texture)
		else:
			texture.visible = false
	else:
		print("No image ", image_path)	
