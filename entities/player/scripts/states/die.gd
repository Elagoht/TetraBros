extends State

@onready var timer: Timer = $DieTimer

func enter() -> void:
	owner.sprites.play("die")
	owner.global_position = Vector2(320, -20)
	owner.renew_health()

func physics_update(_delta: float) -> void:
	owner.move_and_slide()
