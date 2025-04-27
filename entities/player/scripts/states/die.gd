extends State

func enter() -> void:
	owner.sprites.play("die")
	owner.global_position = Vector2(320, 500)
	$DieTimer.start()

func _on_die_timer_timeout() -> void:
	owner.global_position = Vector2(320, -20)
	owner.velocity = Vector2.ZERO
	owner.renew_health()
