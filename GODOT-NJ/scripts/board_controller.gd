extends Node

class_name BoardController

# Two-dimensional Array
var board: Array

func get_tile_at_position(var x: int, var y: int) -> Object:
	if _position_is_out_of_bounds(x, y):
		return null
	return board[x][y]

func tile_at_position_is_blocked(var x: int, var y: int) -> bool:
	return _position_is_out_of_bounds(x, y) || board[x][y] == null || board[x][y].state == Globals.TileState.BLOCKED

func _position_is_out_of_bounds(var x: int, var y: int) -> bool:
	return x < 0 || y < 0 || x >= Constants.BOARD_WIDTH || y >= Constants.BOARD_HEIGHT
