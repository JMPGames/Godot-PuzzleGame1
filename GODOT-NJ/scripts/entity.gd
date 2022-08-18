extends Area2D


class_name Entity

export(Constants.EntityType) var entity_type
export(String) var title


func place_entity(var new_x, var new_y):
	position.x = new_x
	position.y = new_y
