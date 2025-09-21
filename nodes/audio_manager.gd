extends Node3D

#all sounds
var jump_sfx = preload("res://sounds/sfx_movement_jump15.wav")
var dive_sfx = preload("res://sounds/sfx_movement_jump13.wav")
var walk_sfx_1 = preload("res://sounds/sfx_movement_footsteps1a.wav")
var walk_sfx_2 = preload("res://sounds/sfx_movement_footsteps1b.wav")
var left_right_step = false

#menu sounds
var menu_down = preload("res://sounds/menu/menu_down.wav")
var menu_up = preload("res://sounds/menu/menu_up.wav")
var menu_select = preload("res://sounds/menu/sfx_menu_select5.wav")


@onready var player_sfx = $player_sfx
@onready var ui_sfx = $ui_sfx
var music = "$music"

#menu funcs
func menu_up_play():
	ui_sfx.stream = menu_up
	ui_sfx.play()
func menu_down_play():
	ui_sfx.stream = menu_down
	ui_sfx.play()
func menu_select_play():
	ui_sfx.stream = menu_select
	ui_sfx.play()

#player funcs
func player_jump():
	player_sfx.stream = jump_sfx
	player_sfx.play()
func player_dive():
	player_sfx.stream = dive_sfx
	player_sfx.play()
func player_walk():
	if !player_sfx.playing:
		if !left_right_step:
			player_sfx.stream = walk_sfx_1
			player_sfx.play()
			left_right_step = true
		else:	
			player_sfx.stream = walk_sfx_2
			player_sfx.play()
			left_right_step = false
	
	
