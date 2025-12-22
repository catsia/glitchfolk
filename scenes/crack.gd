extends Sprite2D

# Плавность следования
@export var smoothness: float = 0.1
# Стартовая позиция курсора (относительные координаты 0-1)
@export var cursor_start_position: Vector2 = Vector2(0.5, 0.5)

var _mouse_offset: Vector2 = Vector2.ZERO
var _is_active: bool = false

func _ready():
	# Сохраняем начальное смещение
	_mouse_offset = get_global_mouse_position() - global_position
	
	# Устанавливаем курсор в указанную позицию
	var viewport = get_viewport()
	var viewport_size = viewport.get_visible_rect().size
	var screen_pos = Vector2(
		cursor_start_position.x * viewport_size.x,
		cursor_start_position.y * viewport_size.y
	)
	viewport.warp_mouse(screen_pos)
	
	# Обновляем смещение после перемещения курсора
	_mouse_offset = get_global_mouse_position() - global_position
	
	Input.mouse_mode = Input.MOUSE_MODE_HIDDEN

func _process(delta):
	var mouse_pos = get_global_mouse_position()
	
	# Активируем отслеживание при первом движении мыши
	if not _is_active:
		var expected_pos = global_position + _mouse_offset
		if mouse_pos.distance_to(expected_pos) > 1.0:
			_is_active = true
	
	if _is_active:
		# Целевая позиция с сохранением смещения
		var target_pos = mouse_pos - _mouse_offset
		global_position = global_position.lerp(target_pos, smoothness)

func _exit_tree():
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
