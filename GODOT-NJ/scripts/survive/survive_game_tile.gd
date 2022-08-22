extends Tile

class_name SurviveGameTile

func activate() -> void:
	if state == Globals.TileState.OPEN:
		game_controller.decrease_tiles_left()
		if numbers[1] <= 9:
			game_controller.adjust_health(-numbers[1])
		elif numbers[1] == Constants.BOMB_INDEX:
			game_controller.pressed_bomb()
	._adjust_state()

func flip() -> void:
	if state == Globals.TileState.OPEN:
		numbers.append(numbers.pop_front())
		_update_displays(numbers[0], numbers[1], numbers[2])

func _ready():
	._ready()
	_update_displays(
		_get_number(rng.randi_range(0, 10)),
		_get_number(rng.randi_range(0, 10)),
		_get_number(rng.randi_range(0, 10))
	)

func _get_number(var r: int) -> int:
	if r > 9:
		if special_display_placed:
			return rng.randi_range(0, 9)

		special_display_placed = true
	else:
		game_controller.total_numbers += 1
		game_controller.sum_of_numbers += r
	return r
