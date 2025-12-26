extends Control

func _on_start_but_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/preintro.tscn")

func _on_exit_button_pressed() -> void:
	get_tree().quit()

func _ready(): 
	await get_tree().create_timer(2.5).timeout
	create_tween().tween_property($CanvasLayer/fade_out, "modulate:a", 0.0, 2.0)
