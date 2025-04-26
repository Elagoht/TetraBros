extends Area2D

class_name Spell

@export var damage: int = 1
@export var speed: float = 500
@export var fired_by: Node = null
@export var knockback_force: float = 200.0

func _ready():
	$LifeTime.start()

func _on_area_entered(area: Area2D) -> void:
	if area.owner == fired_by:
		return
	if area.has_method("take_damage"):
		var direction = (area.global_position - global_position).normalized()
		var knockback = direction * knockback_force
		area.take_damage(damage, knockback)
	queue_free()

func _on_life_time_timeout() -> void:
	queue_free()
