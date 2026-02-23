extends Node

signal play_all_interactive
signal resume_game_signal
signal area_seen_signal
signal button_clicked_signal
signal stop_all
signal ellipse_buttons
signal line_buttons
signal triangle_buttons
signal hexagon_buttons
signal scene_loaded

func emit_play_all_interactive():
	play_all_interactive.emit()
	
func emit_resume_game():
	resume_game_signal.emit()

func emit_area_seen():
	area_seen_signal.emit()
	
func emit_button_clicked_with_timeline(timeline_name):
	button_clicked_signal.emit(timeline_name)

func emit_stop_all():
	stop_all.emit()

func emit_ellipse_buttons():
	ellipse_buttons.emit()

func emit_line_buttons():
	line_buttons.emit()

func emit_triangle_buttons():
	triangle_buttons.emit()

func emit_hexagon_buttons():
	hexagon_buttons.emit()

func emit_scene_loaded():
	scene_loaded.emit()
