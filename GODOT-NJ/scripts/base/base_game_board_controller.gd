extends BoardController

class_name BaseGameBoardController

func activate_tile_at_position(var x: int, var y: int) -> void:
	if .get_tile_at_position(x, y).state == Globals.TileState.OPEN:
		_flip_adjacent_tiles_around_position(x, y)
	.get_tile_at_position(x, y).activate()

func _flip_adjacent_tiles_around_position(var x: int, var y: int) -> void:
	var tiles_to_flip := [
		.get_tile_at_position(x, y + 1),
		.get_tile_at_position(x - 1, y),
		.get_tile_at_position(x, y - 1),
		.get_tile_at_position(x + 1, y),
	]
	for tile in tiles_to_flip:
		if tile != null:
			tile.flip()
