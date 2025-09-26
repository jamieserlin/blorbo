extends Control
var Thirst = 200
var MaxTime
var end_screen = preload("res://youdied.tscn")
@onready var timer = $Timer
var can_remove = true

func _ready() -> void:
	timer.start()
	MaxTime = timer.time_left
	get_tree().root.set_meta("hydration", self)
	print("Initalised")
	
func _process(delta: float) -> void:
	if can_remove:
		Thirst = 2 * timer.time_left
		$ProgressBar.value = Thirst
	if Thirst <= 0:
		var new_lvl = end_screen.instantiate()
		get_tree().root.add_child(new_lvl)

func _on_timer_timeout() -> void:
	print("Timer Stop")
	
func refill() -> void:
	var new_time = timer.time_left
	if timer.time_left >= MaxTime * 0.5: #When reached a certain percent, the hydration will be maxed to prevent overcapping
		new_time = MaxTime
		timer.stop()
		timer.start(new_time)
	else:
		new_time += MaxTime * 0.5 #Otherwise, gain hydration normally
		timer.stop()
		timer.start(new_time)
	print("Time added")
	
	
	
