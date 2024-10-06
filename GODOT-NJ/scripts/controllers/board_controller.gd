extends Node
class_name BoardController

var board: Array
var game_controller: GameController
var sound_controller: SoundController
var board_size: Vector2

func build_board(
	_game_controller: GameController,
	_sound_controller: SoundController,
	selected_board_size: Vector2
) -> void:
	game_controller = _game_controller
	sound_controller = _sound_controller
	board_size = selected_board_size
	for x in range(selected_board_size.x):
		board.append([])
		for y in range(selected_board_size.y):
			board[x].append(_spawn_tile(x, y))

func get_tile_at_position(x: int, y: int) -> Object:
	return null if _position_is_out_of_bounds(x, y) else board[x][y]

func tile_at_position_is_blocked(x: int, y: int) -> bool:
	return _position_is_out_of_bounds(x, y) || board[x][y] == null || board[x][y].state == Globals.TileState.BLOCKED

func activate_tile_at_position(x: int, y: int) -> void:
	var tile: Object = get_tile_at_position(x, y)
	if tile.state == Globals.TileState.OPEN:
		_flip_adjacent_tiles_around_position(x, y)
	tile.activate()

func _flip_adjacent_tiles_around_position(x: int, y: int) -> void:
	var tiles_to_flip: Array = [
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
	tile.initialize(game_controller, sound_controller, self)
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
