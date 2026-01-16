extends AnimatedSprite2D


func _on_cosmos_animation_finished() -> void:
	AnimationManager._hide_animation(self.get_parent(), "cosmos")
	self.visible = true
	self.play()
