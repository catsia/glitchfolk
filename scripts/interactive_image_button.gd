extends Button

func _ready():
	pressed.connect(on_pressed)
	
func on_pressed():
	ImageSceneManager.play_idle(self.name)
