extends Node3D
#create a dialogue file in dialogue button above lol
var resource = load("res://npc/foggy/wet_foggy.dialogue")
const my_scene = preload("res://npc/wet_foggy_dialogue.tscn")
var in_body = false
var balloon
var started = false
#use the example balloon to create an interaction
#nready var balloon = $ExampleBalloon

# dialogue resource? idfk//// dialogue start is the title of the dialogue
@export var dialogue_resource: DialogueResource
@export var dialogue_start: String = "start"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:	
	
	return
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Interact") && in_body && !started:
			var new_enemy = my_scene.instantiate()
			add_child(new_enemy)
			balloon = get_tree().get_first_node_in_group("hippo_dialogue")
			if balloon != null:
				var player = get_tree().get_first_node_in_group("player")
				if player != null:
					player.velocity = Vector3(0,0,0)
				player.in_dialogue = true
				started = true
				balloon.start(resource, dialogue_start)
	pass


func _on_area_3d_body_shape_entered(body_rid: RID, body: Node3D, body_shape_index: int, local_shape_index: int) -> void:
	if body.is_in_group("player"):
		in_body = true
		body.can_interact = true
		print("FUCK")
		
	pass # Replace with function body.


func _on_area_3d_body_shape_exited(body_rid: RID, body: Node3D, body_shape_index: int, local_shape_index: int) -> void:
	if body.is_in_group("player"):
		body.in_dialogue = false
		body.can_interact = false
		started = false
		in_body = false
	pass # Replace with function body.
