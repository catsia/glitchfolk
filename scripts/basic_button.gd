extends Button

var dialogSignalManager = preload("res://scripts/dialogic_signal_manager.gd")
var timelineManager = preload("res://scripts/timeline_manager.gd")

var dialog_manager
var timeline_manager

func _ready():
	dialog_manager = dialogSignalManager.new()
	timeline_manager = timelineManager.new()
	
func after_pressed():
	self.hide()
	InteractiveObjManager.object_clicked()
