extends Area3D

func _ready() -> void:
	self.body_entered.connect(_on_body_entered)

func _on_body_entered(body: Node) -> void:
	if body.is_in_group("player"):  # tag your player with "player" group
		print("Player drank cola")
		var hydrate = get_tree().root.get_node("res://hydration.gd")
		hydrate.refill()
		queue_free()  # remove cola after pickup
		
		
