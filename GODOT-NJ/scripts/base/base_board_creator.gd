extends Node

class_name BaseBoardCreator

func _ready() -> void:
	_create_board()
	_place_player()
	get_node("../GameController").begin()
	
func _create_board() -> void:
	var board_controller := get_node("../BoardController")
	for x in range(Constants.BOARD_WIDTH):
		board_controller.board.append([])
		for y in range(Constants.BOARD_HEIGHT):
			board_controller.board[x].append(_spawn_tile(x, y))

func _place_player() -> void:
	var rng := RandomNumberGenerator.new()
	rng.randomize()
	get_node("../Player").place_entity(
		rng.randi_range(0, Constants.BOARD_WIDTH - 1),
		rng.randi_range(0, Constants.BOARD_HEIGHT - 1)
	)

func _spawn_tile(var x: int, var y: int) -> Node:
	var tile := Globals.base_tile_object.instance()
	add_child(tile)
	tile.place_entity(x, y)
	return tile
