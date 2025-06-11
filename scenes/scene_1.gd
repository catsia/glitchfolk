extends Node2D

func _ready():
	Dialogic.signal_event.connect(_on_dialogic_signal)
	Dialogic.start("scene1")

func _on_dialogic_signal(data: Dictionary, args = []):
	if typeof(data) == TYPE_DICTIONARY:
		if data.has("animation"):
			_play_animation(data["animation"])
		if data.has("show_image"):
			_show_image(data["show_image"])
		if data.has("hide_image"):
			_hide_image(data["hide_image"])			
			
func _play_animation(signal_name: String):
	var animation = get_node(signal_name)
	if animation != null:
		animation.play()
	else:
		print("No animation ", signal_name)


func _show_image(image_path: String):
	var texture = get_node(image_path)
	if texture != null:
		texture.visible = true
	else:
		print("No image ", image_path)	


func _hide_image(image_path: String):
	var texture = get_node(image_path)
	if texture != null:
		texture.visible = false
	else:
		print("No image ", image_path)	
