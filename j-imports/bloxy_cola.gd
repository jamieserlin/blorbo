extends Area3D

@export var respawn_time = 15  
@onready var respawn_timer: Timer = Timer.new()
var active := true

func _ready() -> void:
	self.body_entered.connect(_on_body_entered)
	
	respawn_timer.one_shot = true
	add_child(respawn_timer)
	respawn_timer.timeout.connect(respawns)

func _on_body_entered(body: Node) -> void:
	if not active:
		return
	if body.is_in_group("player"):
		var hydration = get_tree().root.get_meta("hydration")
		if hydration:  
			hydration.refill()
			despawns()
		
func despawns() -> void:
	get_tree().get_first_node_in_group("audio_manager").cola_sfx()
	active = false
	visible = false
	respawn_timer.start(respawn_time)
	
func respawns() -> void:
	active = true
	visible = true
	print("Respawned")
