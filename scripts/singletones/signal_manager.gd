extends Node

signal play_all_interactive
signal resume_game_signal
signal area_seen_signal
signal button_clicked_signal
signal stop_all

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
