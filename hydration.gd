extends Control
var Thirst = 100
var MaxThirst = 100
var MinThirst = 0

func _ready() -> void:
	$Timer.start()
	get_tree().root.set_meta("hydration", self)
	print("Initalised")
	
func _process(delta: float) -> void:
	Thirst = 2 * $Timer.time_left
	$ProgressBar.value = Thirst
	#print($Timer.time_left)

func _on_timer_timeout() -> void:
	print("Timer Stop")
	
func refill() -> void:
	var new_time = $Timer.time_left
	if $Timer.time_left >= 37:
		new_time = 50
		$Timer.stop()
		$Timer.start(new_time)
	else:
		new_time += 25
		$Timer.stop()
		$Timer.start(new_time)
	print("Time added")
	
	
