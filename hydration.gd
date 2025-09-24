extends Control
var Thirst = 100
var MaxThirst = 100
var MinThirst = 0

func _ready() -> void:
	$Timer.start()
	print("Initalised")
	
func _process(delta: float) -> void:
	Thirst = 2 * $Timer.time_left
	$ProgressBar.value_changed(Thirst)

func _on_timer_timeout() -> void:
	print("Timer Stop")
	
