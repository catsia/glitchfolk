extends Node

var current_scene: Node
var path = "res://scenes/{scene_name}.tscn"

func _ready():
	current_scene = get_tree().current_scene

func change_scene(scene_name: String):
	var fullpath = path.format({ "scene_name": scene_name })
	get_tree().change_scene_to_file(fullpath)

func get_current_scene() -> Node:
	return current_scene

func set_current_scene(scene: Node):
	current_scene = scene
	SignalManager.emit_scene_loaded()
