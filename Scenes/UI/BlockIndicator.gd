extends TextureRect

func update_block_display():
	match BattleData.player_face:
			"Top":
				texture.current_frame = 0
				return
			"Right":
				texture.current_frame = 1
				return
			"Bottom":
				texture.current_frame = 2
				return
			"Left":
				texture.current_frame = 3
				return
