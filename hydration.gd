extends Control
var Thirst = 200
var MaxTime

func _ready() -> void:
	$Timer.start()
	MaxTime = $Timer.time_left
	get_tree().root.set_meta("hydration", self)
	print("Initalised")
	
func _process(delta: float) -> void:
	Thirst = 2 * $Timer.time_left
	$ProgressBar.value = Thirst

func _on_timer_timeout() -> void:
	print("Timer Stop")
	
func refill() -> void:
	var new_time = $Timer.time_left
	if $Timer.time_left >= MaxTime * 0.5: #When reached a certain percent, the hydration will be maxed to prevent overcapping
		new_time = MaxTime
		$Timer.stop()
		$Timer.start(new_time)
	else:
		new_time += MaxTime * 0.5 #Otherwise, gain hydration normally
		$Timer.stop()
		$Timer.start(new_time)
	print("Time added")
	
	
	
