extends Label

var winner

func _ready() -> void:
	var loser = Score.loser
	var winner: int
	match loser:
		1:
			winner = 2
		2:
			winner = 1  
			
	text = "Player " + str(winner) + " won!"
