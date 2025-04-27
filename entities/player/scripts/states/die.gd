extends State

func ready() -> void:
	owner.sprites.play("die")
	$"../../Collision".queue_free()
	$"../../HitBox".queue_free()
