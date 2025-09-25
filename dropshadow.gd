extends Node3D
@onready var raycast = $RayCast3D
@onready var decal = $Decal

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if raycast.is_colliding():
		decal.global_position.y = raycast.get_collider().global_position.y
	pass
