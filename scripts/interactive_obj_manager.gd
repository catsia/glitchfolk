extends Node

var total = 0
var second_wave_total = 0
var clicked = 0
var second_wave_clicled = 0

signal next_timeline

func _ready() -> void:
	add_user_signal("next_timeline")
	add_user_signal(GlobalVariables.stop_all)

func register_objects(counter: int):
	total = counter

func register_second_wave_object():
	second_wave_total += 1

func register_object():
	total += 1

func close_eye():
	if clicked >= total && second_wave_clicled >= second_wave_total:
		ImageSceneManager.set_image_state_and_play(GlobalVariables.eye_key, GlobalVariables.eye_closed_state)
	
func second_wave_clicked():
	second_wave_clicled += 1
	if second_wave_clicled >= second_wave_total:
		close_eye()
		emit_end_signals()


func object_clicked():
	clicked += 1
	if clicked >= total:
		close_eye()
		emit_end_signals()

func emit_end_signals():
	emit_signal("next_timeline")
	emit_signal(GlobalVariables.stop_all)
