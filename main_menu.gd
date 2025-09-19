extends Control


func _on_start_game_button_pressed() -> void:
	print("Start Game Pressed")
	get_tree().change_scene_to_file("res://j-Testing Level.tscn")


func _on_options_button_pressed() -> void:
	print("Options Pressed")


func _on_quit_button_pressed() -> void:
	print("Quit Pressed")
	get_tree().quit()
