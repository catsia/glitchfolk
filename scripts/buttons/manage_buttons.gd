extends CanvasLayer

func get_button(button_id) -> Button:
	return get_node_or_null(button_id)
	
func change_button_visibility(button_id: String, isVisible: bool):
	get_button(button_id).visible = isVisible
