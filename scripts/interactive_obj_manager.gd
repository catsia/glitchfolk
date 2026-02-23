extends Node

var interactive_obj = {}
var second_interactive_obj = {}
var clicked_obj = {}

signal next_timeline

func _ready() -> void:
	add_user_signal("next_timeline")
	add_user_signal(GlobalVariables.stop_all)


func register_second_wave_object(uid: String):
	if (!clicked_obj.has(uid)):
		second_interactive_obj[uid]=""

func register_object(uid: String):
	if (!clicked_obj.has(uid)):
		interactive_obj[uid]=""

func close_eye():
	if (second_interactive_obj.is_empty()) && (interactive_obj.is_empty()):
		ImageSceneManager.set_image_state_and_play(GlobalVariables.eye_key, GlobalVariables.eye_closed_state)
	
func second_wave_clicked(uid: String):
	second_interactive_obj.erase(uid)
	clicked_obj[uid] = ""
	if (second_interactive_obj.is_empty()):
		close_eye()
		emit_end_signals()


func object_clicked(uid:String):
	interactive_obj.erase(uid)
	clicked_obj[uid] = ""
	
	print(interactive_obj)
	if(interactive_obj.is_empty()):
		close_eye()
		emit_end_signals()

func emit_end_signals():
	emit_signal("next_timeline")
	emit_signal(GlobalVariables.stop_all)

func get_save_data() -> Dictionary:
	var data = {}
	data["interactive_obj"]=interactive_obj
	data["second_interactive_obj"]=second_interactive_obj
	data["clicked_obj"]=clicked_obj
	
	return data

func load_save_data(data: Dictionary):
	second_interactive_obj=data["second_interactive_obj"]
	interactive_obj=data["interactive_obj"]
	clicked_obj=data["clicked_obj"]
	

	
