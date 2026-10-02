extends Node3D

@export var obstacleList: Array[PackedScene] = []

func _ready() -> void:
	var obstacle1: PackedScene = obstacleList.pick_random()
	var path1: String = obstacle1.resource_path
	var loadedScene1 = load(path1)
	var instance1 = loadedScene1.instantiate()
	add_child(instance1)
	print("object spawned")

func _on_timer_timeout() -> void:
	var obstacle: PackedScene = obstacleList.pick_random()
	var path: String = obstacle.resource_path
	var loadedScene = load(path)
	var instance = loadedScene.instantiate()
	add_child(instance)
	print("object spawned")
