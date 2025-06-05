extends Node2D

func _ready():
	Dialogic.signal_event.connect(_on_dialogic_signal)
	Dialogic.start("intro")

func _on_dialogic_signal(signal_name: String, args = []):
	var animation = get_node(signal_name)
	if animation != null:
		animation.play()
	else:
		print("No animation ", signal_name)
		
		
