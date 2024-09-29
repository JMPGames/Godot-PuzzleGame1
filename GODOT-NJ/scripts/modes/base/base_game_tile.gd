extends Tile

class_name BaseGameTile

var highest_number: int

func activate() -> void:
	if state == Globals.TileState.OPEN:
		game_controller.increase_tiles_pressed()
		if numbers[1] <= 9:
			game_controller.increase_score(numbers[1])
		elif numbers[1] == Constants.BOMB_INDEX:
			game_controller.adjust_health(-1)
			game_controller.increase_score(0)
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
	game_controller.increase_max_score(highest_number)

func _get_number(var r: int = -1) -> int:
	if r > 9:
		if special_display_placed:
			return rng.randi_range(0, 9)

		special_display_placed = true
	else:
		if r > highest_number:
			highest_number = r
	return r
