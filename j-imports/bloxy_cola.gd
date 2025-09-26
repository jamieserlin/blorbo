extends Area3D

@export var respawn_time = 5  # seconds
@onready var respawn_timer: Timer = Timer.new()

func _ready() -> void:
	self.body_entered.connect(_on_body_entered)

func _on_body_entered(body: Node) -> void:
	if body.is_in_group("player"):
		var hydration = get_tree().root.get_meta("hydration")
		if hydration:  # always check it's valid
			hydration.refill()
			despawns()
		
func despawns() -> void:
	visible = false
	monitoring = false
	respawn_timer.autostart
	respawn_timer.start(respawn_time)
	print("Despawn timer: " && respawn_timer.time_left)
	respawn_timer.one_shot
	if respawn_timer.is_stopped():
		pass
		
	
func respawns() -> void:
	visible = true
	monitoring = true
	print("Respawned")
