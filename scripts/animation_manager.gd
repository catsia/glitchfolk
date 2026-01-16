extends Node

func _stop_animation(context: Node, signal_name: String):
	print(signal_name + "!!!!")
	var animation = context.get_node_or_null(signal_name)
	if animation:
		animation.stop()
	else:
		print("No animation ", signal_name)	
	
func _play_animation(context: Node, signal_name: String):
	var animation =  context.get_node_or_null(signal_name)
	if animation:
		if animation.has_meta("fade_in"):
			ImageManager.fade_in(context, animation)
		else:
			animation.visible = true
		animation.play()
	else:
		print("No animation ", signal_name)

func _hide_animation(context: Node, signal_name: String):
	var animation = context.get_node_or_null(signal_name)
	if animation:
		if animation.has_meta("fade_out"):
			ImageManager.fade_out(context, animation)
		else:
			animation.visible = false
	else:
		print("No animation ", signal_name)	
	
