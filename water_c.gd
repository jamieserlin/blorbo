extends Area3D
var water_respawn
func _ready() -> void:
	water_respawn = get_tree().get_first_node_in_group("water_respawn")
func _on_body_shape_entered(body_rid: RID, body: Node3D, body_shape_index: int, local_shape_index: int) -> void:
	if body.is_in_group("player"):
		body.global_position = water_respawn.global_position
		print("FUCK")
	pass # Replace with function body.
