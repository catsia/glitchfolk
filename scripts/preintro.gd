extends Node

func _ready() -> void:
	InteractiveObjManager.next_timeline.connect(next_timeline)
	SignalManager.button_clicked_signal.connect(area_cliked)
	
func next_timeline():
	Dialogic.start(self.get_meta("timeline"))

func area_cliked(timeline_name: String):
	Dialogic.start(timeline_name)
