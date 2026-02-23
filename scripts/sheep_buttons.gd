extends Node

func _ready() -> void:
	SignalManager.ellipse_buttons.connect(change_eclipse_buttons)
	SignalManager.line_buttons.connect(change_line_buttons)
	SignalManager.triangle_buttons.connect(change_triangle_buttons)
	SignalManager.hexagon_buttons.connect(change_hexagon_buttons)
	SignalManager.play_all_interactive.connect(close_eye)
	
func close_eye():
	Dialogic.paused = false

func change_eclipse_buttons():
	Dialogic.paused = !Dialogic.paused
	ButtonManager._change_texture_button_visibility(self, "bees")
	ButtonManager._change_texture_button_visibility(self, "sheeps")
	ButtonManager._change_texture_button_visibility(self, "bush1")
	ButtonManager._change_texture_button_visibility(self, "bush2")
	ButtonManager._change_texture_button_visibility(self, "bush3")
	

func change_line_buttons():
	Dialogic.paused = !Dialogic.paused
	ButtonManager._change_texture_button_visibility(self, "line1")
	ButtonManager._change_texture_button_visibility(self, "line2")
	ButtonManager._change_texture_button_visibility(self, "grass1")
	ButtonManager._change_texture_button_visibility(self, "grass2")
	ButtonManager._change_texture_button_visibility(self, "road")
	

func change_triangle_buttons():
	Dialogic.paused = !Dialogic.paused
	ButtonManager._change_texture_button_visibility(self, "triangle1")
	ButtonManager._change_texture_button_visibility(self, "triangle2")
	ButtonManager._change_texture_button_visibility(self, "tree")

func change_hexagon_buttons():
	Dialogic.paused = !Dialogic.paused
	ButtonManager._change_texture_button_visibility(self, "sunflower")
