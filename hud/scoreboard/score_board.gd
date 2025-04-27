extends Control

@export var player_hud: VBoxContainer
@export var player_2hud: VBoxContainer

@onready var score = Vector2i(0, 0)

func _ready() -> void:
	update_scoreboard()

func score_to_player(id: int) -> void:
	score[id] += 1
	update_scoreboard()

func update_scoreboard() -> void:
	if player_hud:
		player_hud.update_score(score.x)
	if player_2hud:
		player_2hud.update_score(score.y)
