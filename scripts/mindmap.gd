extends Sprite2D

@export_range(0.1, 1.0) var move_strength: float = 0.8
@export var move_limit: Vector2 = Vector2(500, 500)

var start_pos: Vector2
var first_mouse_pos: Vector2
var has_started: bool = false

func _ready():
	call_deferred("_center_mouse")
	start_pos = position

func _center_mouse():
	get_viewport().warp_mouse(get_viewport_rect().size / 2)

func _process(delta):
	var mouse = get_global_mouse_position()
	
	if not has_started:
		first_mouse_pos = mouse
		has_started = true
		return
	
	var move = mouse - first_mouse_pos
	move *= move_strength
	
	move.x = clamp(move.x, -move_limit.x, move_limit.x)
	move.y = clamp(move.y, -move_limit.y, move_limit.y)
	
	position = start_pos + move
