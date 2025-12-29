extends Node

signal play_all_interactive
signal resume_game_signal
signal area_seen_signal


func emit_play_all_interactive():
	play_all_interactive.emit()
	
func emit_resume_game():
	resume_game_signal.emit()

func emit_area_seen():
	area_seen_signal.emit()
