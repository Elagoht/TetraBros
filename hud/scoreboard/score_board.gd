extends Control

@onready var huds := [
	$PlayerHUD,
	$Player2HUD
]

@onready var score = Vector2i(2, 1)

func _ready() -> void:
	update_scoreboard()

func update_scoreboard() -> void:
	for player in range(2):
		huds[player].update_score(score.x if player == 0 else score.y)
