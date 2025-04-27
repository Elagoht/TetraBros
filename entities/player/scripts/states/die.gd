extends State

@onready var hit_box: Area2D = %HitBox
@onready var collision: CollisionShape2D = %Collision

const PLAYER = preload("res://entities/player/Player.tscn")
@onready var score: CanvasLayer = $"../../Score"

func enter() -> void:
	owner.sprites.play("die")
	hit_box.queue_free()
	collision.queue_free()
	if owner.global_position.y > 500:
		owner.global_position = Vector2(320, 500)
	$DieTimer.start()

	Score.score[owner.player_id - 1] += 1
	score.refresh_stars()

func _on_die_timer_timeout() -> void:
	var player = PLAYER.instantiate()
	player.player_id = owner.player_id
	player.global_position = Vector2(320, -20)
	get_tree().current_scene.add_child(player)
	state_machine.transition_to("idle")

signal player_died(player: Player)

func exit() -> void:
	owner.queue_free()
	emit_signal("player_died", owner)
