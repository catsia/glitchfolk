extends Node2D

var next_scene = "res://scenes/scene1.tscn"
var fader
var dialog_manager
var dialogSignalManager = preload("res://scripts/dialogic_signal_manager.gd")

func _ready():
	dialog_manager = dialogSignalManager.new()
	Dialogic.signal_event.connect(_on_dialogic_signal)
	Dialogic.timeline_ended.connect(_on_timeline_end)
	Dialogic.start("intro")

func _on_timeline_end():
	fade_and_switch_scene()

func _on_dialogic_signal(data: Dictionary, args = []):
	dialog_manager._manage_dialogic_signal(self, data)

func fade_and_switch_scene():
	var fade = get_node("/root/ScreenFade")
	fade.fade_to_black(1.0, func():
		get_tree().change_scene_to_file(next_scene)
	)

func _on_cosmos_animation_finished() -> void:
	dialog_manager._play_animation(self, "cosmos_cycle")
