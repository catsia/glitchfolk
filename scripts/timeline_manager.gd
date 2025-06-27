extends Node
#not in use
func create_timeline(text:String):
	var events : Array = []
	var text_event = DialogicTextEvent.new()
	text_event.text = text
	events.append(text_event)

	var timeline : DialogicTimeline = DialogicTimeline.new()
	timeline.events = events
	timeline.events_processed = true
	Dialogic.start(timeline)

func start_timeline(timeline_name:String):
	Dialogic.start(timeline_name)
