extends Button

func _ready():
	self.hide()
	InteractiveObjManager.connect("next_timeline", next_timeline)

func next_timeline():
	self.show()

func _on_mouse_entered() -> void:
	Dialogic.start("graveyard2")
	self.hide()
