extends TextureRect

func _ready():
	update_stance_display()


func update_stance_display():
	match BattleData.player_stance:
		"Top":
			texture.current_frame = 0
			return
		"TopRight":
			texture.current_frame = 1
			return
		"TopLeft":
			texture.current_frame = 5
			return
		"Bottom":
			texture.current_frame = 3
			return
		"BottomLeft":
			texture.current_frame = 4
			return
		"BottomRight":
			texture.current_frame = 2
			return
