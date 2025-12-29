extends Area2D

var isSeen = false


func _on_area_entered(area: Area2D) -> void:
	if (isSeen):
		return
	SignalManager.emit_area_seen()
	isSeen = true
	
