extends Area2D

enum EntityType {PLAYER, TILE, ENEMY}
class_name Entity

export(EntityType) var entity_type
export(String) var title

var game_controller: GameController
var board_controller: BoardController
var sound_controller: SoundController
var x: int
var y: int

func initialize(
	_game_controller: GameController,
	_board_controller: BoardController,
	_sound_controller: SoundController
) -> void:
	game_controller = _game_controller
	board_controller = _board_controller
	sound_controller = _sound_controller

func move(new_x: int, new_y: int) -> void:
	if board_controller.tile_at_position_is_blocked(new_x, new_y):
		return

	place_entity(new_x, new_y)
	print(entity_type)
	if entity_type == EntityType.PLAYER:
		sound_controller.play_move_audio()

	board_controller.activate_tile_at_position(x, y)

func place_entity(new_x: int, new_y: int) -> void:
	position = Vector2(new_x * Constants.TILE_GAP, new_y * Constants.TILE_GAP)
	x = new_x
	y = new_y
