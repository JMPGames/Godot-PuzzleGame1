extends BaseBoardCreator

class_name SurviveBoardCreator

func _spawn_tile(var x: int, var y: int) -> Node:
	var tile := Globals.survive_tile_object.instance()
	add_child(tile)
	tile.place_entity(x, y)
	return tile
