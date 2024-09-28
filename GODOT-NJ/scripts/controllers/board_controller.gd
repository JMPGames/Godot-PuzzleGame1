extends Node

class_name BoardController

# Two-dimensional Array
var board: Array
var game_controller: Node
var board_size: Vector2

func build_board(_game_controller: Node, selected_board_size: Vector2) -> void:
	game_controller = _game_controller
	board_size = selected_board_size
	for x in range(selected_board_size.x):
		board.append([])
		for y in range(selected_board_size.y):
			board[x].append(_spawn_tile(x, y))

func get_tile_at_position(var x: int, var y: int) -> Object:
	if _position_is_out_of_bounds(x, y):
		return null
	return board[x][y]

func tile_at_position_is_blocked(var x: int, var y: int) -> bool:
	return _position_is_out_of_bounds(x, y) || board[x][y] == null || board[x][y].state == Globals.TileState.BLOCKED

func activate_tile_at_position(var x: int, var y: int) -> void:
	if get_tile_at_position(x, y).state == Globals.TileState.OPEN:
		_flip_adjacent_tiles_around_position(x, y)
	get_tile_at_position(x, y).activate()

func _flip_adjacent_tiles_around_position(var x: int, var y: int) -> void:
	var tiles_to_flip := [
		get_tile_at_position(x, y + 1),
		get_tile_at_position(x - 1, y),
		get_tile_at_position(x, y - 1),
		get_tile_at_position(x + 1, y),
	]
	for tile in tiles_to_flip:
		if tile != null:
			tile.flip()

func _position_is_out_of_bounds(var x: int, var y: int) -> bool:
	return x < 0 || y < 0 || x >= board_size.x || y >= board_size.y

func _spawn_tile(var x: int, var y: int) -> Node:
	var tile: Node = _get_tile_by_mode()
	tile.initialize(game_controller, self)
	add_child(tile)
	tile.place_entity(x, y)
	return tile

func _get_tile_by_mode() -> Node:
	if DataController.game_mode == Constants.BASE_GAME_MODE_ID:
		return Globals.base_tile_object.instance()
	elif DataController.game_mode == Constants.SURVIVAL_GAME_MODE_ID:
		return Globals.survive_tile_object.instance()
	else:
		return Globals.base_tile_object.instance()
