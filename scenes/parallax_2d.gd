extends Parallax2D

@export var target_node: Node2D 
var follow_strength: float = 0.85

func _process(delta):
	if target_node:
		var target_pos = target_node.global_position
		var screen_center = get_viewport_rect().size / 2
		var offset = (target_pos - screen_center) * follow_strength
		scroll_offset = offset 
