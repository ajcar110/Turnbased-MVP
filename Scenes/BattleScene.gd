extends Node

@onready var UI = $BattleUIRoot
@onready var player_marker = $PlayerMarker
@onready var enemy_marker = $EnemyMarker

func _ready():
	var p_body =BattleData.player.body.instantiate()
	player_marker.add_child(p_body)
	var e_body =BattleData.player.body.instantiate()
	enemy_marker.add_child(e_body)

func resolve():
	if BattleData.player_action is Strike:
		strike(BattleData.player_action, BattleData.enemy)
	elif BattleData.player_action is Block:
		block(BattleData.player_action)
	elif BattleData.player_action is Dodge:
		print("PlayerDodge")
	end_turn()

func _process(delta):
	if BattleData.player_action != null && BattleData.enemy_action != null:
		resolve()
	if BattleData.selected_ability != null:
		if BattleData.selected_ability is Strike:
			UI.update_strike_indicator()
		if BattleData.selected_ability is Block:
			UI.update_strike_indicator()
			UI.update_display()


func end_turn():
	GlobalSignals.EndTurn.emit()
	BattleData.player_action = null
	#BattleData.enemy_action = null
	print("E_HP:")
	print(BattleData.enemy.hp)

func strike(strike: Strike, target: Character):
	target.hp -= strike.damage
	BattleData.player_stance = strike.end_stance

func block(block: Block):
	BattleData.player_face = block.face
