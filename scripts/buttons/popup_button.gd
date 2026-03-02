extends Button

@onready var parent_popup = $".."

func _on_pressed() -> void:
	parent_popup.hide()
