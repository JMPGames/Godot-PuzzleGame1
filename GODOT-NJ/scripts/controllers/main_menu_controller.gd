extends Control

class_name MainMenuController

var GAME_MODES: Array = ["Score Attack", "Survival", "Dungeon"]
var DIFFICULTIES: Array = ["Easy", "Normal", "Hard"]
var BOARD_SIZES: Array = ["Small", "Medium", "Large", "X-Large"]

onready var game_mode_option = $GameModeOption
onready var difficulty_option = $DifficultyOption
onready var board_size_option = $BoardSizeOption

func _ready():
	DataController.set_game_mode(0)
	DataController.set_difficulty(0)
	_addOptions()

func _addOptions():
	for game_mode in GAME_MODES:
		game_mode_option.add_item(game_mode)
	
	for difficulty in DIFFICULTIES:
		difficulty_option.add_item(difficulty)

	for board_size in BOARD_SIZES:
		board_size_option.add_item(board_size)

func _on_StartButton_pressed():
	if DataController.game_mode == Constants.BASE_GAME_MODE_ID:
		# warning-ignore:return_value_discarded
		get_tree().change_scene("res://scenes/BaseGame.tscn")
	elif DataController.game_mode == Constants.SURVIVAL_GAME_MODE_ID:
		# warning-ignore:return_value_discarded
		get_tree().change_scene("res://scenes/SurviveGame.tscn")

func _on_GameModeOption_item_selected(index: int):
	DataController.set_game_mode(index)

func _on_DifficultyOption_item_selected(index: int):
	DataController.set_difficulty(index)

func _on_BoardSizeOption_item_selected(index: int):
	DataController.set_board_size(index)

func _on_QuitButton_button_down():
	get_tree().quit()
