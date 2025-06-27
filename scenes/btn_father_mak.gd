extends "res://scripts/basic_button.gd"

var button_name = "father_mak"

func _ready():
	super._ready()
	InteractiveObjManager.register_object()

func _on_pressed() -> void:
	dialog_manager._stop_animation(get_parent().get_parent(), button_name)
	Dialogic.start(button_name)
	after_pressed()
