extends Entity

class_name Player

func _ready() -> void:
	board_controller = get_node("../BoardController")
	game_controller = get_node("../GameController")
	pass

func _unhandled_input(event) -> void:
	if not game_controller.state == Globals.GameState.ACTIVE:
		return

	if event.is_action_pressed("ui_up"):
		move(x, y - 1)
	
	if event.is_action_pressed("ui_left"):
		move(x - 1, y)
	
	if event.is_action_pressed("ui_down"):
		move(x, y + 1)
		
	if event.is_action_pressed("ui_right"):
		move(x + 1, y)
