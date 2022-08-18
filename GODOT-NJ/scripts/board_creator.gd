extends Node

onready var tile_object: PackedScene = preload("res://prefabs/Tile.tscn")
var board: Array = []

func _ready():
	_create_board(10, 10)

func activate_tile_at_position(var x: int, var y: int):
	board[x][y].activate()

func is_tile_at_position_blocked(var x: int, var y: int):
	return board[x][y] == null || board[x][y].blocked
	
func _create_board(var width: int, var height: int):
	for x in range(width):
		board.append([])
		for y in range(height):
			board[x].append(_spawn_tile(x, y))

	
func _spawn_tile(var x, var y):
	var tile: Area2D = tile_object.instance()
	add_child(tile)
	tile.position = Vector2(x * Constants.TILE_GAP, y * Constants.TILE_GAP)
	return tile
