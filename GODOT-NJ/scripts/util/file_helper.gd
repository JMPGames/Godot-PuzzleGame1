extends Node

class_name FileHelper

func save_data(file_path: String, data_json_str: String) -> void:
	var file: File = File.new()
	file.open(file_path, File.WRITE) # warning-ignore:return_value_discarded
	file.store_string(data_json_str)
	file.close()

func load_data(file_path: String) -> String:
	var file: File = File.new()
	var data_json_str: String = ""
	if file.file_exists(file_path):
		file.open(file_path, File.READ) # warning-ignore:return_value_discarded
		data_json_str = file.get_as_text()
		file.close()

	return data_json_str