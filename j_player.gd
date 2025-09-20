extends CharacterBody3D

##Camera References
@export_group("Camera")
@export_range(0.0,1.0) var mouse_sensitivity := 0.25
@onready var _camera_holder: Node3D = %CameraHolder
@onready var _camera: Camera3D = %Camera3D

##Movement References
@export_group("Movement")
@export var move_speed := 8.0
@export var acceleration := 25.0

##Jump References
@export var jump_impulse := 12.0
@export var _gravity = -30.0

func _input(event:InputEvent) -> void:
	if event.is_action_pressed("LeftClick"):
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	if event.is_action_pressed("ui_cancel"):
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE

var _camera_input_direction := Vector2.ZERO
func _unhandled_input(event: InputEvent) -> void:
	var is_camera_motion := (
		event is InputEventMouseMotion and 
		Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED
	)
	if is_camera_motion:
		_camera_input_direction = event.screen_relative * mouse_sensitivity
		

func _physics_process(delta: float) -> void:
	##CAMERA
	_camera_holder.rotation.x += _camera_input_direction.y * delta
	## _camera_holder.rotation.x = clamp(_camera_holder.rotation.x, -PI /6.0, PI/3.0)
	_camera_holder.rotation.y -= _camera_input_direction.x * delta
	_camera_input_direction = Vector2.ZERO
	
	##MOVEMENT
	var raw_input := Input.get_vector("MoveLeft", "MoveRight","MoveForward", "MoveBackward")
	var forward := _camera.global_basis.z
	var right := _camera.global_basis.x
	
	var move_direction := forward *raw_input.y + right * raw_input.x
	move_direction.y = 0.0
	move_direction = move_direction.normalized()
	
	var y_velocity := velocity.y
	velocity.y = 0.0
	
	velocity = velocity.move_toward(move_direction * move_speed, acceleration * delta)
	##JUMPING
	velocity.y = y_velocity + _gravity * delta
	
	var is_starting_jump := Input.is_action_just_pressed("Jump") and is_on_floor()
	if is_starting_jump:
		velocity.y += jump_impulse

	move_and_slide()
