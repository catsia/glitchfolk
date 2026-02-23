extends Control
	
func _on_cont_button_pressed() -> void:
	SignalManager.emit_resume_game()

func _on_exit_button_pressed() -> void:
	get_tree().quit()

func _on_save_button_pressed() -> void:
	SavingLoadingManager.save()

func _on_load_button_pressed() -> void:
	SavingLoadingManager.load_game()
