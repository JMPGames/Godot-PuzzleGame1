extends Node

class_name PauseMenuController

var game_controller: GameController
var sound_controller: SoundController
var menu_panel: Panel

func initialize(_game_controller: GameController, _sound_controller: SoundController) -> void:
	game_controller = _game_controller
	sound_controller = _sound_controller
	menu_panel = get_node("../UI/UI/Menu")

func _on_MenuButton_button_up():
	if game_controller.state == Globals.GameState.GAME_OVER:
		menu_panel.visible = true
		sound_controller.play_ui_positive_audio()
	else:
		menu_panel.visible = not menu_panel.visible
		if menu_panel.visible:
			game_controller.state = Globals.GameState.PAUSED
			sound_controller.play_ui_positive_audio()
		else:
			game_controller.state = Globals.GameState.ACTIVE
			sound_controller.play_ui_negative_audio()

func _on_ResumeButton_button_up():
	if game_controller.state != Globals.GameState.GAME_OVER:
		menu_panel.visible = false
		sound_controller.play_ui_negative_audio()
		game_controller.state = Globals.GameState.ACTIVE

func _on_RestartButton_button_up():
	sound_controller.play_ui_positive_audio()
	get_tree().reload_current_scene() # warning-ignore:return_value_discarded

func _on_QuitToMenuButton_button_up():
	sound_controller.play_ui_negative_audio()
	get_tree().change_scene(Constants.MAIN_MENU_SCENE_PATH) # warning-ignore:return_value_discarded
