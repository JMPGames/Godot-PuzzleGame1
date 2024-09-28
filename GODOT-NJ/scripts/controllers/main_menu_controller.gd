extends Control

class_name MainMenuController

var GAME_MODES: Array = ["Score Attack", "Survival", "Dungeon"]
var DIFFICULTIES: Array = ["Easy", "Normal", "Hard"]
var BOARD_SIZES: Array = ["8x8", "16x16", "24x24", "32x32"]

onready var game_mode_option = $GameModeOption
onready var difficulty_option = $DifficultyOption
onready var board_size_option = $BoardSizeOption

func _ready():
	SceneController.set_game_mode(0)
	SceneController.set_difficulty(0)
	_addOptions()

func _addOptions():
	for game_mode in GAME_MODES:
		game_mode_option.add_item(game_mode)
	
	for difficulty in DIFFICULTIES:
		difficulty_option.add_item(difficulty)

	for board_size in BOARD_SIZES:
		board_size_option.add_item(board_size)

func _on_StartButton_pressed():
	print(SceneController.game_mode)
	if SceneController.game_mode == Constants.BASE_GAME_MODE_ID:
		# warning-ignore:return_value_discarded
		get_tree().change_scene("res://scenes/BaseGame.tscn")
	elif SceneController.game_mode == Constants.SURVIVAL_GAME_MODE_ID:
		# warning-ignore:return_value_discarded
		get_tree().change_scene("res://scenes/SurviveGame.tscn")

func _on_GameModeOption_item_selected(index:int):
	SceneController.set_game_mode(index)

func _on_DifficultyOption_item_selected(index:int):
	SceneController.set_difficulty(index)


func _on_BoardSizeOption_item_selected(index):
	SceneController.set_board_size(index)
