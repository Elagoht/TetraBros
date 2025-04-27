extends Label

var winner
var skippable := false

func _ready() -> void:
	var loser = Score.loser
	match loser:
		1:
			winner = 2
		2:
			winner = 1
			
	text = "Player " + str(winner) + " won!"
