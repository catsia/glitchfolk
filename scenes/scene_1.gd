extends Node2D

var dialog_manager
var dialogSignalManager = preload("res://scripts/dialogic_signal_manager.gd")

func _ready():
	dialog_manager = dialogSignalManager.new()
	Dialogic.signal_event.connect(_on_dialogic_signal)
	Dialogic.start("scene1")

func _on_dialogic_signal(data: Dictionary, args = []):
	dialog_manager._manage_dialogic_signal(self, data)	
			
