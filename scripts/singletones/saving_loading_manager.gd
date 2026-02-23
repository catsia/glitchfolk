extends Node

const SAVE_PATH := "user://saveFile.json"
var is_being_loaded: bool = false

func save():
	var data = {}
	
	data["scene"] = get_tree().current_scene.name

	Dialogic.Save.save()
	
	data["active_images"] = ImageSceneManager.active_images
	data["image_states"] = ImageSceneManager.image_states
	
	data["singletons"] = save_singleton_states()
	
	data["persistent_nodes"] = save_persistent_nodes()
	
	var file = FileAccess.open(SAVE_PATH, FileAccess.WRITE)
	if file:
		file.store_string(JSON.stringify(data, "\t"))
		file.close()
	else:
		push_error("Failed to open save file for writing")

func load_game():
	if not FileAccess.file_exists(SAVE_PATH):
		print("No save file found")
		return false
	
	var file = FileAccess.open(SAVE_PATH, FileAccess.READ)
	if not file:
		push_error("Failed to open save file")
		return false
	
	var data = JSON.parse_string(file.get_as_text())
	file.close()
	
	if data == null:
		print("Save file is corrupted or empty")
		return false
	is_being_loaded = true
	load_singleton_states(data.get("singletons", {}))
	
	ImageSceneManager.image_states = data.get("image_states", {})
	ImageSceneManager.active_images = data.get("active_images", [])
	
	SceneManager.change_scene(data.get("scene", ""))
	
	await get_tree().process_frame
	await get_tree().process_frame
	
	load_persistent_nodes(data.get("persistent_nodes", {}))
	Dialogic.Save.load()
	
	is_being_loaded = false
	SignalManager.emit_scene_loaded()
	return true

func save_singleton_states() -> Dictionary:
	var singleton_data = {}
	singleton_data = InteractiveObjManager.get_save_data()
	return singleton_data

func load_singleton_states(data: Dictionary):
	if data.is_empty():
		return
	
	InteractiveObjManager.load_save_data(data)


func is_save_present() -> bool:
	return FileAccess.file_exists(SAVE_PATH)

func save_persistent_nodes() -> Dictionary:
	var nodes_data = {}
	var persistent_nodes = get_tree().get_nodes_in_group("persist")
	for node in persistent_nodes:
		nodes_data[node.get_path()] = {
			"visible": node.visible if "visible" in node else true,
			"disabled": node.disabled if "disabled" in node else false,
			"position": var_to_str(node.position) if "position" in node else "",
			"modulate": var_to_str(node.modulate) if "modulate" in node else "",
			"is_playing": var_to_str(node.is_playing()) if "is_playing" in node else "",
			"frame": var_to_str(node.frame) if "frame" in node else "",
	}
	return nodes_data

func load_persistent_nodes(data: Dictionary):
	for node_path in data.keys():
		if !SceneManager.current_scene.has_node(node_path):
			continue
		var node = SceneManager.current_scene.get_node(node_path)
		var node_data = data[node_path]
		if "visible" in node and "visible" in node_data:
			node.visible = node_data["visible"]

		if "disabled" in node and "disabled" in node_data:
			node.disabled = node_data["disabled"]

		if "position" in node and node_data["position"] != "":
			node.position = str_to_var(node_data["position"])

		if "modulate" in node and node_data["modulate"] != "":
			node.modulate = str_to_var(node_data["modulate"])
		
		if "frame" in node and node_data["frame"] != "":
			node.frame = str_to_var(node_data["frame"])
		
		if "is_playing" in node and node_data["is_playing"] == "true":
			node.play()
