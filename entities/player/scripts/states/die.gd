extends State

@onready var hit_box: Area2D = %HitBox
@onready var collision: CollisionShape2D = %Collision

func enter() -> void:
	owner.sprites.play("die")
	hit_box.queue_free()
	collision.queue_free()
	if owner.global_position.y > 500:
		owner.global_position = Vector2(320, 500)
	$DieTimer.start()

func _on_die_timer_timeout() -> void:
	var player_scn = load("res://entities/player/player.tscn")
	var player = player_scn.instantiate()
	player.player_id = owner.player_id
	player.global_position = Vector2(320, -20)
	get_tree().current_scene.add_child(player)
	state_machine.transition_to("idle")

signal player_died(player: Player)

func exit() -> void:
	owner.queue_free()
	emit_signal("player_died", owner)
