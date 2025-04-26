extends Control

@onready var huds := [
	$AspectRatioContainer/HBoxContainer/PlayerHUD,
	$AspectRatioContainer/HBoxContainer/Player2HUD
]

@onready var score = Vector2i.ZERO

func update_scoreboard() -> void:
	for player in range(2):
		huds[player].update_score(score.x if player == 0 else score.y)
