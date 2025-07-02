extends Node2D

var next_scene = "res://scenes/scene1.tscn"
var fader
var dialog_manager
var dialogSignalManager = preload("res://scripts/dialogic_signal_manager.gd")

func _ready():
	dialog_manager = dialogSignalManager.new()
	Dialogic.signal_event.connect(_on_dialogic_signal)
	Dialogic.start("intro")


func _on_dialogic_signal(data: Dictionary, args = []):
	dialog_manager._manage_dialogic_signal(self, data)

func _on_cosmos_animation_finished() -> void:
	$cosmos_cycle.show()
	dialog_manager._play_animation(self, "cosmos_cycle")
