extends Button

var dialogSignalManager = preload("res://scripts/dialogic_signal_manager.gd")

var dialog_manager
var timeline_manager

@export var animation: AnimatedSprite2D

var isPressed: bool = false

func _ready():
	SignalManager.play_all_interactive.connect(play_animation)
	dialog_manager = dialogSignalManager.new()
	InteractiveObjManager.register_object()
	
func after_pressed():
	isPressed = true
	self.hide()
	InteractiveObjManager.object_clicked()
	
func play_animation():
	if !isPressed:
		animation.visible = true
		animation.play()
	
func _on_pressed() -> void:
	animation.stop()
	Dialogic.start(animation.name.substr(0,animation.name.length()))
	after_pressed()
