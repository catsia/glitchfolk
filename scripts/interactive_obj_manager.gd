extends Node

var total = 0
var clicked = 0

signal next_timeline

func _ready() -> void:
	add_user_signal("next_timeline")

func register_objects(counter: int):
	total = counter

func register_object():
	total += 1

func object_clicked():
	clicked += 1
	if clicked >= total:
		emit_signal("next_timeline")
