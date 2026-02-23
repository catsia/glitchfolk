extends Button

var dialogSignalManager = preload("res://scripts/dialogic_signal_manager.gd")

@export var animation: AnimatedSprite2D

var isPressed: bool = false

func _ready():
	SignalManager.play_all_interactive.connect(play_animation)
	InteractiveObjManager.register_object(self.name)
	InteractiveObjManager.connect(GlobalVariables.stop_all, stop_animation)

func stop_animation():
	animation.visible = false
	animation.stop()
	self.hide()


func play_animation():
	if !isPressed:
		animation.visible = true
		animation.play()

func register_click():
	if !isPressed:
		isPressed = true
		InteractiveObjManager.object_clicked(self.name)

func _on_pressed() -> void:
	Dialogic.start(animation.name.substr(0,animation.name.length()))
	register_click()
