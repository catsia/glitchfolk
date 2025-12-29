extends CanvasLayer

var dialog_manager
var timeline_manager

var dialogSignalManager = preload("res://scripts/dialogic_signal_manager.gd")
@onready var pause_menu = $pause_menu

var paused = false

func _ready():
	dialog_manager = dialogSignalManager.new()
	SignalManager.resume_game_signal.connect(pause_game)
	Dialogic.signal_event.connect(_on_dialogic_signal)
	start_timeline()

func _on_dialogic_signal(data: Dictionary, args = []):
	dialog_manager._manage_dialogic_signal(self, data)	
	
func _process(delta: float) -> void:
	if (Input.is_action_just_pressed("pause")):
		pause_game()

func start_timeline():
	if (self.get_meta("timeline")):
		Dialogic.start(self.get_meta("timeline"))

func pause_game():
	if paused:
		pause_menu.get_child(0).hide()
		Engine.time_scale = 1
	else:
		pause_menu.get_child(0).show()
		Engine.time_scale = 0
	paused = !paused
	Dialogic.paused = paused
