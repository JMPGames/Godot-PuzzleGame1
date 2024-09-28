extends Node

class_name PauseMenuController

var game_controller: GameController
var menu_panel: Panel

func initialize(_game_controller: GameController) -> void:
	game_controller = _game_controller
	menu_panel = get_node("../UI/UI/Menu")

func _on_MenuButton_button_up():
	if game_controller.state == Globals.GameState.GAME_OVER:
		menu_panel.visible = true
	else:
		menu_panel.visible = not menu_panel.visible
		game_controller.state = Globals.GameState.PAUSED if menu_panel.visible else Globals.GameState.ACTIVE

func _on_ResumeButton_button_up():
	if game_controller.state != Globals.GameState.GAME_OVER:
		menu_panel.visible = false
		game_controller.state = Globals.GameState.ACTIVE

func _on_RestartButton_button_up():
	get_tree().reload_current_scene()

func _on_QuitToMenuButton_button_up():
	get_tree().change_scene("res://scenes/MainMenu.tscn")
