extends Node3D

@export var obstacleList: Array[PackedScene] = []

func _on_timer_timeout() -> void:
	var obstacle: PackedScene = obstacleList.pick_random()
	var path: String = obstacle.resource_path
	var loadedScene = load(path)
	var instance = loadedScene.instantiate()
	add_child(instance)
	print("object spawned")
