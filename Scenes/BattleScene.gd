extends Node

@onready var UI = $BattleUIRoot

func resolve():
	if BattleData.player_action is Strike:
		strike(BattleData.player_action, BattleData.enemy)
	elif BattleData.player_action is Block:
		print("PlayerBlock")
	elif BattleData.player_action is Dodge:
		print("PlayerDodge")
	end_turn()

func _process(delta):
	if BattleData.player_action != null && BattleData.enemy_action != null:
		resolve()
	if BattleData.selected_ability != null:
		if BattleData.selected_ability is Strike:
			UI.update_strike_indicator()


func end_turn():
	GlobalSignals.EndTurn.emit()
	BattleData.player_action = null
	#BattleData.enemy_action = null
	print("E_HP:")
	print(BattleData.enemy.hp)

func strike(strike: Strike, target: Character):
	target.hp -= strike.damage
	BattleData.stance = strike.end_stance
