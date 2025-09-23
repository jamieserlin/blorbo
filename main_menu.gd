extends Control


@onready var v_box_container: VBoxContainer = $VBoxContainer
@onready var options_menu: Panel = $OptionsMenu
@onready var game_title: Label = $GameTitle





@onready var audio_manager = get_tree().get_first_node_in_group("audio_manager")
var gameplay_scene = preload("res://j-Dry Level.tscn").instantiate()
func _ready() -> void:
	$VBoxContainer/StartGameButton.grab_focus()
	v_box_container.visible = true
	options_menu.visible = false
	game_title.visible = true
	
func _on_start_game_button_pressed() -> void:
	print("Start Game Pressed")
	get_tree().root.add_child(gameplay_scene)
	self.queue_free()
	#get_tree().change_scene_to_file("res://j-Dry Level.tscn")


func _on_options_button_pressed() -> void:
	print("Options Pressed")
	toggle_menu_visability()
	


func _on_quit_button_pressed() -> void:
	print("Quit Pressed")
	get_tree().quit()


func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_up"):
		audio_manager.menu_up_play()
	if Input.is_action_just_pressed("ui_down"):
		audio_manager.menu_down_play()
	if Input.is_action_just_pressed("Enter") or Input.is_action_just_pressed("ui_select") or Input.is_action_just_pressed("Jump"):
		audio_manager.menu_select_play()

func toggle_menu_visability() -> void:
	print("Swapped Menu Layers!")
	v_box_container.visible = !v_box_container.visible
	options_menu.visible = !options_menu.visible
	game_title.visible = !game_title.visible
	


func _on_back_button_pressed() -> void:
	toggle_menu_visability()
