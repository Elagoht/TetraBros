extends CanvasLayer

const STAR = preload("res://hud/star.png")

@onready var right_aligned: bool

const SCREEN_WIDTH = 640

func _ready() -> void:
	right_aligned = owner.player_id < 2
	refresh_stars()

func refresh_stars() -> void:
	if Score.score[owner.player_id - 1] > 4:
		Score.loser = owner.player_id
		get_tree().change_scene_to_file("res://levels/Winner.tscn")
	
	# Remove existing stars
	for child in get_children():
		if child is Sprite2D:
			remove_child(child)
			child.queue_free()
	var star_spacing = 20
	var y = 20
	var max_stars = 5
	var score = min(Score.score[owner.player_id - 1], max_stars)
	for index in max_stars:
		var star_sprite = Sprite2D.new()
		star_sprite.texture = STAR
		if right_aligned:
			star_sprite.position = Vector2(SCREEN_WIDTH - 20 - index * star_spacing, y)
		else:
			star_sprite.position = Vector2(20 + index * star_spacing, y)
		if index >= score:
			star_sprite.modulate = Color(0, 0, 0, 0.5)
		add_child(star_sprite)
