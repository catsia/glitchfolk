extends Button

@export var animation: AnimatedSprite2D

func _ready():
	self.hide()
	SignalManager.play_all_interactive.connect(play_animation)
	InteractiveObjManager.connect("next_timeline", next_timeline)
	InteractiveObjManager.register_second_wave_object(self.name)

func next_timeline():
	self.show()
	animation.visible = true
	animation.play()

func play_animation():
	animation.play()

func _on_pressed() -> void:
	animation.stop()
	Dialogic.start(animation.name.substr(0,animation.name.length()))
	InteractiveObjManager.emit_end_signals()
	self.hide()
	self.disabled = true
	InteractiveObjManager.second_wave_clicked(self.name)
