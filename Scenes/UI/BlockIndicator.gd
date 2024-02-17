extends TextureRect


func _ready():
	update_block_display()


func update_block_display():
	match BattleData.face:
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
