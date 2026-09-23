extends AnimatableBody3D

@export var speed: float
@export var direction = Vector3(-1,0,0)

func _physics_process(delta: float) -> void:
	var motion = direction.normalized() * speed * delta
	
	move_and_collide(motion)
