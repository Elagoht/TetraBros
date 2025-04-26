extends Area2D

class_name Spell

@export var damage: int = 10
@export var speed: float = 500
@export var fired_by: Node = null

func _ready():
	$LifeTime.start()

func _on_area_entered(area: Area2D):
	if area.owner == fired_by:
		return
	if area.has_method("take_damage"):
		area.take_damage(damage)
	queue_free()

func _on_life_time_timeout() -> void:
	queue_free()
