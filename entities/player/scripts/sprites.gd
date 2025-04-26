extends AnimatedSprite2D

func handle_looking_direction(direction: float) -> void:
	if direction == 0:
		return
	owner.sprites.flip_h = direction < 0
