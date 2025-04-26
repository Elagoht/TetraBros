extends Spell

func _physics_process(delta):
	position += transform.x * delta * speed
