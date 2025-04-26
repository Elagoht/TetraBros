extends Area2D

class_name Spell

@export var damage: int = 1
@export var speed: float = 500
@export var fired_by: Node = null
@export var knockback_force: float = 200.0

func _ready():
	if has_node("AnimatedSprite2D"):
		var sprite = $AnimatedSprite2D
		if sprite.frames.has_animation("default"):
			sprite.play("default")

	var my_timer = Timer.new()
	my_timer.wait_time = .8
	my_timer.one_shot = true
	add_child(my_timer)
	my_timer.start()
	my_timer.connect("timeout", Callable(self, "_on_my_timer_timeout"))

	if not is_connected("area_entered", Callable(self, "_on_area_entered")):
		connect("area_entered", Callable(self, "_on_area_entered"))


func _on_my_timer_timeout() -> void:
	queue_free()

func _on_area_entered(area: Area2D) -> void:
	if area.owner == fired_by:
		return
	if area.has_method("take_damage"):
		var direction = (area.global_position - global_position).normalized()
		var knockback = direction * knockback_force
		area.take_damage(damage, knockback)
	queue_free()
