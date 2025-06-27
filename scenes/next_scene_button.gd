extends "res://scripts/basic_button.gd"

var button_name = "father_mak"

func _ready():
	self.hide()

	super._ready()
	InteractiveObjManager.connect("next_timeline", next_timeline)

func next_timeline():
	self.show()

func _on_mouse_entered() -> void:
	Dialogic.start("graveyard2")
	self.hide()
