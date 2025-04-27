extends State

const FIREBALL = preload("res://entities/spells/Fireball.tscn")

func enter() -> void:
	owner.sprites.play("cast_spell")
	$Spell1Timer.start(0.7)
	owner.velocity = Vector2.ZERO

func update(_delta: float) -> void:
	pass

func exit() -> void:
	owner.velocity = Vector2.ZERO

func _on_spell_1_timer_timeout() -> void:
	state_machine.transition_to("idle")
	var fireball = FIREBALL.instantiate()
	get_tree().current_scene.add_child(fireball)
	fireball.fired_by = owner
	fireball.direction = owner.get_direciton()
	fireball.position = owner.position+Vector2(16*fireball.direction.x, -12)
	fireball.get_node("Sprite").flip_h = fireball.direction.x != 1
