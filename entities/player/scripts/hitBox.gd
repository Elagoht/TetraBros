extends Area2D

func take_damage(amount: int = 1, knockback: Vector2 = Vector2.ZERO) -> void:
	if owner.is_stunned:
		return

	owner.health -= amount

	if knockback != Vector2.ZERO and owner.has_method("apply_knockback"):
		owner.apply_knockback(knockback)

	if owner.health <= 0:
		owner.health = 0
		owner.stun_player()
