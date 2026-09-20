extends CharacterBody3D


const MOVE_SPEED = 10.0
const MOVE_ACCEL = 0
const GRAVITY = Vector3(0, -9.8, 0) * 5
const JUMP_VELOCITY = 7
const JUMP_INITIAL_ACCEL = 2
var jump_accel = 0


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += GRAVITY * delta
	
	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		jump_accel = JUMP_INITIAL_ACCEL
		velocity.y = jump_accel + JUMP_VELOCITY
	
	if Input.is_action_pressed("jump") and velocity.y >= 0:
		velocity.y += jump_accel
	
	if jump_accel >= 0:
		jump_accel -= delta * 9.8

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir := Input.get_vector("move_left", "move_right", "ui_up", "ui_down")
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * MOVE_SPEED
		velocity.z = direction.z * MOVE_SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, MOVE_SPEED)
		velocity.z = move_toward(velocity.z, 0, MOVE_SPEED)

	move_and_slide()
