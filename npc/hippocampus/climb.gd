extends Node3D
#create a dialogue file in dialogue button above lol
var in_body = false
var balloon
var player_body

# Called when the node enters the scene tree for the first time.
func _ready() -> void:	
	
	return
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Interact") && in_body:
		pass
	pass


func _on_area_3d_body_shape_entered(body_rid: RID, body: Node3D, body_shape_index: int, local_shape_index: int) -> void:
	if body.is_in_group("player"):
		player_body = body
		in_body = true
		print("FUCK")
		
	pass # Replace with function body.


func _on_area_3d_body_shape_exited(body_rid: RID, body: Node3D, body_shape_index: int, local_shape_index: int) -> void:
	if body.is_in_group("player"):
		in_body = false
	pass # Replace with function body.
