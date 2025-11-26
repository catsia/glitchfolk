extends Button

func _ready():
	pressed.connect(on_pressed)
	
func on_pressed():
	ImageSceneManager.set_image_state_and_play(self.name, GlobalVariables.eye_side_state)
	SignalManager.emit_play_all_interactive()
