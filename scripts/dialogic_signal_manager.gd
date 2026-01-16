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
		if data.has("stop_animation"):
			_stop_animation(context, data["stop_animation"])
		if data.has("next_scene"):
			_next_scene(context, data["next_scene"])
		if data.has("set_state"):
			_set_state(context, data["set_state"])	
		if data.has("next_timeline"):
			_next_timeline(context, data["next_timeline"])	
		if data.has("play_all_interactive"):
			_play_all_interactive()
		if data.has("stop_all"):
			_stop_all()	
			
func _next_scene(context: Node, next_scene: String):
	var path = "res://scenes/" + next_scene + ".tscn"
	context.get_tree().change_scene_to_file(path)

func _next_timeline(context: Node, next_timeline: String):
	Dialogic.start_timeline(next_timeline)

func _play_all_interactive():
	SignalManager.emit_play_all_interactive()

func _stop_all():
	SignalManager.emit_stop_all()

func _set_state(context: Node, argument: String):
	var parts = argument.split("_")
	if(parts.size() >= 2): 
		ImageSceneManager.set_image_state_and_play(parts[0], parts[1])

func _play_animation(context: Node, signal_name: String):
	AnimationManager._play_animation(context, signal_name)

func _show_image(context: Node, image_path: String):
	ImageManager.show_image(context, image_path)


func _hide_image(context: Node, image_path: String):
	ImageManager.hide_image(context, image_path)

func _hide_animation(context: Node, signal_name: String):
	AnimationManager._hide_animation(context, signal_name)
		
func _stop_animation(context: Node, signal_name: String):
	AnimationManager._stop_animation(context, signal_name)
		
