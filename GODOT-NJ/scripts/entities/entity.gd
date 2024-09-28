extends Area2D

enum EntityType {PLAYER, TILE, ENEMY}
class_name Entity

export(EntityType) var entity_type
export(String) var title
var board_controller: Node
var game_controller: Node
var x: int
var y: int

func initialize(_game_controller: Node, _board_controller: Node) -> void:
	game_controller = _game_controller
	board_controller = _board_controller

func move(var new_x: int, var new_y: int) -> void:
	if board_controller.tile_at_position_is_blocked(new_x, new_y):
		return
	
	# TODO:: Smooth movement (LERP)
	place_entity(new_x, new_y)
	board_controller.activate_tile_at_position(x, y)

func place_entity(var new_x: int, var new_y: int) -> void:
	position = Vector2(new_x * Constants.TILE_GAP, new_y * Constants.TILE_GAP)
	x = new_x
	y = new_y
