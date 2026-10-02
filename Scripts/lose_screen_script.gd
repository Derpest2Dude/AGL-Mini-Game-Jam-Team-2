extends Control


func _enter_tree() -> void:
	$Score.text = "Score %.0f" % [Score]


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Levels/main_menu.tscn")
