extends Sprite2D

func _process(_delta: float) -> void:
	self.modulate.a = lerp(self.modulate.a, owner.sphere_opacity_target, 0.1)
