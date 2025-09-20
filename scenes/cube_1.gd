extends CanvasLayer

var dialog_manager
var timeline_manager

var dialogSignalManager = preload("res://scripts/dialogic_signal_manager.gd")
var timelineManager = preload("res://scripts/timeline_manager.gd")

func _ready():
	dialog_manager = dialogSignalManager.new()
	timeline_manager = timelineManager.new()
	
	Dialogic.signal_event.connect(_on_dialogic_signal)
	Dialogic.start("cube1")

func _on_dialogic_signal(data: Dictionary, args = []):
	dialog_manager._manage_dialogic_signal(self, data)	
