extends Area2D

const speed: int = 300
@onready var fired_by: Node = null
@onready var direction: Vector2i = Vector2i.RIGHT

func _ready() -> void:
	$Audio.play()

func _physics_process(delta):
	position += direction * speed * delta
	if position.x > 700:
		queue_free()

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("tile"):
		queue_free()

func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("player"):
		if area.owner != fired_by:
			area.owner.apply_knockback(direction*100)
			area.take_damage(1)
			queue_free()

	if area.is_in_group("block"):
		queue_free()
