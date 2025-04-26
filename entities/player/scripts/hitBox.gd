extends Area2D

func take_damage(amount: int = 1) -> void:
	if owner.is_stunned:
		return
	owner.health -= amount
	if owner.health <= 0:
		owner.health = 0
		owner.stun_player()
	print(amount, owner.health)
