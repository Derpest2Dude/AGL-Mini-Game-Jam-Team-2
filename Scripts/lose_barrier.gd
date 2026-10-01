extends Area3D





func _on_body_entered(body: Node3D) -> void:
	if body.scene_file_path == "res://Scenes/Test Scenes/test_player.tscn":
		get_tree().change_scene_to_file("res://Scenes/Levels/lose_screen.tscn")
