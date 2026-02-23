extends Node

var current_images_node: Node

var image_states = {}
var active_images = [] 

func _ready():
	current_images_node = find_images_node()
	SignalManager.scene_loaded.connect(_on_scene_changed)

func _on_scene_changed():
	current_images_node = find_images_node()
	restore_images()

func find_images_node() -> Node:
	var scene = get_tree().current_scene
	if (scene):
		return scene.find_child("InteractiveImages", true, false)
	else:
		return null

func play_idle(image_id: String):
	current_images_node.play_idle(image_id, get_image_state(image_id))

func restore_images():
	if not current_images_node:
		return
	
	for image_id in active_images:
		if current_images_node and current_images_node.has_method("show_image"):
			current_images_node.show_image(image_id, image_states[image_id].state)

func add_active_image(image_id: String, node: Node):
	active_images.append(image_id)
	if current_images_node and current_images_node.has_method("show_image"):
			current_images_node.show_image(image_id)

func remove_active_image(image_id: String):
	active_images.erase(image_id)
	if current_images_node and current_images_node.has_method("hide_image"):
			current_images_node.hide_image(image_id)

func get_image_state(image_id: String) -> String:
	return image_states.get(image_id, {}).get("state", "default")

func set_image_state_and_play(image_id: String, state: String):
	if state == GlobalVariables.next:
		state = create_next_state(image_id)
		
	if image_id not in active_images:
		active_images.append(image_id)
	if image_id in image_states:
		image_states[image_id].state = state
	else:
		image_states[image_id] = {"state": state}
	if current_images_node and current_images_node.has_method("set_image_state_and_play"):
		current_images_node.set_image_state_and_play(image_id, state)

func create_next_state(image_id: String):
	var state = int(get_image_state(image_id))
	state = 1 if state == null else state + 1
	return str(state)
	
