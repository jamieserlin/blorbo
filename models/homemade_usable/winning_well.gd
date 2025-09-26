extends Node3D
#create a dialogue file in dialogue button above lol
var new_level = preload("res://wet_level.tscn")
var in_body = false
var balloon
#use the example balloon to create an interaction
#nready var balloon = $ExampleBalloon


# Called when the node enters the scene tree for the first time.
func _ready() -> void:	
	
	return
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Interact") && in_body:
			get_tree().get_first_node_in_group("audio_manager").transition()
			var new_lvl = new_level.instantiate()
			get_tree().root.add_child(new_lvl)
			get_tree().get_first_node_in_group("dry_level").queue_free()
			
	pass


func _on_area_3d_body_shape_entered(body_rid: RID, body: Node3D, body_shape_index: int, local_shape_index: int) -> void:
	if body.is_in_group("player"):
		in_body = true
		print("FUCK")
		
	pass # Replace with function body.


func _on_area_3d_body_shape_exited(body_rid: RID, body: Node3D, body_shape_index: int, local_shape_index: int) -> void:
	if body.is_in_group("player"):
		in_body = false
	pass # Replace with function body.
