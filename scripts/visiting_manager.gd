extends Node

@export var areas: Array[Area2D]
var total = 0
var await_time = 25
var SceneManager = preload("res://scripts/scene_manager.gd")
var scene_manager

func _ready() -> void:
	scene_manager = SceneManager.new()
	total = areas.size()
	SignalManager.area_seen_signal.connect(one_area_seen)

func one_area_seen():
	show_image()
	hide_image()
	total -= 1
	if (total <= 0):
		end_scene()
		return


func end_scene():
	await get_tree().create_timer(await_time).timeout
	scene_manager.load_scene(self, GlobalVariables.second_part_graveyard_scene)
	
func show_image():
	#var image_name: String = total
	ImageManager.show_image(self, str(total))

func hide_image():
	#var name = total + 1
	#var image_name: String = name
	ImageManager.hide_image(self, str(total + 1))
	
