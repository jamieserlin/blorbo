extends Node3D
#create a dialogue file in dialogue button above lol
var resource = load("res://hippocampus.dialogue")
#use the example balloon to create an interaction
@onready var balloon = $ExampleBalloon

# dialogue resource? idfk//// dialogue start is the title of the dialogue
@export var dialogue_resource: DialogueResource
@export var dialogue_start: String = "start"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:	
	balloon.start(resource, dialogue_start)
	return
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
