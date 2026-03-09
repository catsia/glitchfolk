extends Button

var dialogSignalManager = preload("res://scripts/dialogic_signal_manager.gd")

@export var animation: AnimatedSprite2D

var isPressed: bool = false

func _ready():
	SignalManager.play_all_interactive.connect(play_animation)
	InteractiveObjManager.register_object(self.name)
	InteractiveObjManager.connect(GlobalVariables.stop_all, stop_animation)

func stop_animation():
	animation.visible = false
	animation.stop()
	self.hide()


func play_animation():
	if !isPressed:
		animation.visible = true
		animation.play()

func register_click():
	if !isPressed:
		isPressed = true
		InteractiveObjManager.object_clicked(self.name)

func _on_pressed() -> void:
	Dialogic.start(animation.name.substr(0,animation.name.length()))
	register_click()


func _on_paragraph_1_mouse_entered() -> void:
	get_parent().get_node("Paragraph1Lightup").show()
	
func _on_paragraph_1_mouse_exited() -> void:
	get_parent().get_node("Paragraph1Lightup").hide()
	
	
func _on_paragraph_2_mouse_entered() -> void:
	get_parent().get_node("Paragraph2Lightup").show()

func _on_paragraph_2_mouse_exited() -> void:
	get_parent().get_node("Paragraph2Lightup").hide()


func _on_paragraph_3_mouse_entered() -> void:
	get_parent().get_node("Paragraph3Lightup").show()


func _on_paragraph_3_mouse_exited() -> void:
	get_parent().get_node("Paragraph3Lightup").hide()


func _on_paragraph_4_mouse_entered() -> void:
	get_parent().get_node("Paragraph4Lightup").show()


func _on_paragraph_4_mouse_exited() -> void:
	get_parent().get_node("Paragraph4Lightup").hide()
