extends CharacterBody3D


const MOVE_SPEED = 15.0
const MOVE_ACCEL = 1
const MOVE_DECEL = MOVE_ACCEL * 2
const GRAVITY = Vector3(0, -9.8, 0) * 5
const JUMP_VELOCITY = 7
const JUMP_INITIAL_ACCEL = 2
const JUMP_DECEL = 10
var jump_accel = 0
var direction = 1
var mantling = false

func _physics_process(delta: float) -> void:
	
	if mantling:
		velocity.y = 4
	# Add the gravity.
	if not is_on_floor():
		velocity += GRAVITY * delta
	
	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		jump_accel = JUMP_INITIAL_ACCEL
		velocity.y = jump_accel + JUMP_VELOCITY
	
	if Input.is_action_pressed("jump") and velocity.y > 0:
		velocity.y += jump_accel
	
	if jump_accel >= 0:
		jump_accel -= delta * JUMP_DECEL

	# Get the input direction and handle the movement/deceleration.
	if Input.is_action_just_pressed("move_left"):
		direction = -1
	elif Input.is_action_just_pressed("move_right"):
		direction = 1
	if is_on_floor():
		if Input.is_action_pressed("move_left") or Input.is_action_pressed("move_right"):
			if velocity.normalized().x == direction:
				velocity.x = move_toward(velocity.x, MOVE_SPEED * direction, MOVE_ACCEL)
			elif velocity.normalized().x != direction:
				velocity.x = move_toward(velocity.x, MOVE_SPEED * direction, MOVE_DECEL)
		else:
			velocity.x = move_toward(velocity.x, 0, MOVE_DECEL)

	move_and_slide()


func _on_ledge_detection_body_entered(body: Node3D) -> void:
	mantling = true
	print(body.get_path())
	print(mantling)


func _on_ledge_detection_body_exited(body: Node3D) -> void:
	mantling = false
	velocity.x = 2
	print(body.get_path())
	print(mantling)
