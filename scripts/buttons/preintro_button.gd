extends TextureButton

var isPressed = false

func _ready() -> void:
	SignalManager.play_all_interactive.connect(change_button_disabled)
	SignalManager.stop_all.connect(change_button_disabled)

func _on_pressed() -> void:
	isPressed = true
	self.disabled = true
	SignalManager.emit_button_clicked_with_timeline(get_timeline_meta())

func change_button_disabled():
	if (isPressed):
		return
	self.visible = !self.visible
	self.disabled = !self.disabled

func get_timeline_meta() -> String:
	if(self.has_meta(GlobalVariables.timeline_meta)):
		return self.get_meta(GlobalVariables.timeline_meta)
	return ""
