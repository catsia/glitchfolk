extends Node

	
func play_sound(context: Node, sound_name: String):
	var sound: AudioStreamPlayer2D = context.get_node_or_null(sound_name)
	if sound:
		sound.play()
	else:
		print("No sound ", sound_name)	

func stop_sound(context: Node, sound_name: String):
	var sound: AudioStreamPlayer2D = context.get_node_or_null(sound_name)
	if sound:
		sound.stop()
	else:
		print("No sound ", sound_name)		
