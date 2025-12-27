extends Control

func _on_cont_button_pressed() -> void:
	SignalManager.emit_resume_game()


func _on_exit_button_pressed() -> void:
	get_tree().quit()
