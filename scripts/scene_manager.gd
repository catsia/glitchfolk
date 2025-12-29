extends Node

func load_scene(context: Node, scene_name: String):
	var path = "res://scenes/" + scene_name + ".tscn"
	context.get_tree().change_scene_to_file(path)
