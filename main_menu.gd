extends Control

@onready var audio_manager = get_tree().get_first_node_in_group("audio_manager")
var gameplay_scene = preload("res://j-Dry Level.tscn").instantiate()
func _ready() -> void:
	$VBoxContainer/StartGameButton.grab_focus()
func _on_start_game_button_pressed() -> void:
	print("Start Game Pressed")
	get_tree().root.add_child(gameplay_scene)
	self.queue_free()
	#get_tree().change_scene_to_file("res://j-Dry Level.tscn")


func _on_options_button_pressed() -> void:
	print("Options Pressed")


func _on_quit_button_pressed() -> void:
	print("Quit Pressed")
	get_tree().quit()
func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_up"):
		audio_manager.menu_up_play()
	if Input.is_action_just_pressed("ui_down"):
		audio_manager.menu_down_play()
	if Input.is_action_just_pressed("Enter") or Input.is_action_just_pressed("ui_select"):
		audio_manager.menu_select_play()
