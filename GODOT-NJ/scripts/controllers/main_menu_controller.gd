extends Control

class_name MainMenuController

onready var game_mode_option = $GameModeOption
onready var difficulty_option = $DifficultyOption
onready var board_size_option = $BoardSizeOption
onready var stats_panel = $StatsPanel

func _ready():
	DataController.load_data()
	_addOptions()
	game_mode_option.select(DataController.game_mode)
	difficulty_option.select(DataController.difficulty)
	board_size_option.select(DataController.board_size)
	stats_panel.setup()

func _addOptions():
	for game_mode in Constants.GAME_MODES:
		game_mode_option.add_item(game_mode)
	
	for difficulty in Constants.DIFFICULTIES:
		difficulty_option.add_item(difficulty)

	for board_size in Constants.BOARD_SIZES:
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
	stats_panel.setup()

func _on_DifficultyOption_item_selected(index: int):
	DataController.set_difficulty(index)
	stats_panel.setup()

func _on_BoardSizeOption_item_selected(index: int):
	DataController.set_board_size(index)
	stats_panel.setup()

func _on_QuitButton_button_down():
	get_tree().quit()
