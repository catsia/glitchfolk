extends Area2D

var isSeen = false

func _on_area_entered(area: Area2D) -> void:
	if (isSeen):
		return
	_play_sound()
	SignalManager.emit_area_seen()
	isSeen = true

func _play_sound():
	for child in self.find_children("*sound*"):
		child.play()
