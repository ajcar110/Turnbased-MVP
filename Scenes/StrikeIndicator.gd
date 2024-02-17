extends TextureRect

func _ready():
	clear()

func clear():
	texture.current_frame = 6

func update_strike_display():
	match BattleData.selected_ability.end_stance:
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
			texture.current_frame = 2
			return
		"BottomRight":
			texture.current_frame = 4
			return
	clear()