extends Node3D
#create a dialogue file in dialogue button above lol
var new_level = preload("res://wet_level.tscn")
var in_body = false
var balloon
#use the example balloon to create an interaction
#nready var balloon = $ExampleBalloon
@onready var audio_manager = get_tree().get_first_node_in_group("audio_manager")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:	
	
	return
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Interact") && in_body:
			audio_manager.music3_play()
			get_tree().get_first_node_in_group("audio_manager").transition()
			var new_lvl = new_level.instantiate()
			get_tree().root.add_child(new_lvl)
			get_tree().get_first_node_in_group("dry_level").queue_free()
			
	pass


func _on_area_3d_body_shape_entered(body: Node3D) -> void:
	if body.is_in_group("player"):
		in_body = true
		body.can_interact = true
		print("FUCK")
		
	pass # Replace with function body.


func _on_area_3d_body_shape_exited(body: Node3D) -> void:
	if body.is_in_group("player"):
		body.can_interact = false
		in_body = false
	pass # Replace with function body.
