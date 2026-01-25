extends Node

func _enable_button(context: Node, button_name: String):
	var button: Button = context.get_node_or_null(button_name)
	if button:
		set_button_visible_and_diabled(button, false, true)
	else:
		print("No button ", button_name)	
	
func _stop_button(context: Node, button_name: String):
	var button: Button = context.get_node_or_null(button_name)
	if button:
		set_button_visible_and_diabled(button, true, false)
	else:
		print("No button ", button_name)	

func _change_button_visibility(context: Node, button_name: String):
	var button: Button = context.get_node_or_null(button_name)
	if button:
		set_button_visible_and_diabled(button, !button.visible, !button.disabled)
	else:
		print("No button ", button_name)

func _change_texture_button_visibility(context: Node, button_name: String):
	var button: TextureButton = context.get_node_or_null(button_name)
	if button:
		set_texture_button_visible_and_diabled(button, !button.visible, !button.disabled)
	else:
		print("No button ", button_name)

func set_texture_button_visible_and_diabled(button: TextureButton, visible: bool, disabled: bool):
	button.visible = visible
	button.disabled = disabled

func set_button_visible_and_diabled(button: Button, visible: bool, disabled: bool):
	button.visible = visible
	button.disabled = disabled
