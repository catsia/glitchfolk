extends Sprite2D

@export_range(0.01, 1.0) var move_strength: float = 0.8
@export var move_limit: Vector2 = Vector2(500, 500)

var start_pos: Vector2
var accumulated_move: Vector2 = Vector2.ZERO
var center: Vector2
var is_paused = false
var speed_delta = 0.2

func _ready():
	SignalManager.resume_game_signal.connect(pause_game)
	call_deferred("_center_mouse")
	start_pos = position

func _center_mouse():
	center = get_viewport_rect().size / 2
	get_viewport().warp_mouse(center)

func _process(delta):
	if (Input.is_action_just_pressed("pause")):
		pause_game()
	if(is_paused):
		return
	var mouse = get_global_mouse_position()
	var delta_move = mouse - center

	accumulated_move += delta_move * move_strength * speed_delta
	accumulated_move.x = clamp(accumulated_move.x, -move_limit.x, move_limit.x)
	accumulated_move.y = clamp(accumulated_move.y, -move_limit.y, move_limit.y)

	position = start_pos + accumulated_move
	position = position.lerp(start_pos + accumulated_move, delta * 5.0)

	get_viewport().warp_mouse(center)

func pause_game():
	is_paused = !is_paused
