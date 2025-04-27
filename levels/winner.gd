extends Label

var winner
var skippable := false

func _ready() -> void:
	var loser = Score.loser
	var winner: int
	match loser:
		1:
			winner = 2
		2:
			winner = 1
			
	text = "Player " + str(winner) + " won!"

func _unhandled_input(event: InputEvent) -> void:
	if !skippable:
		return
	get_tree().change_scene_to_file("res://levels/main_menu/MainMenu.tscn")


func _on_timer_timeout() -> void:
	skippable = true
