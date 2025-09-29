extends Control
const menu_scene = preload("res://nodes/root_node.tscn")

func _on_timer_timeout() -> void:
	get_tree().get_first_node_in_group("dry_level").queue_free()
	get_tree().reload_current_scene()
	get_tree().get_first_node_in_group("death_screen").queue_free()
	
	pass # Replace with function body.
