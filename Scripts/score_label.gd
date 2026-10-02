extends Label


func _on_score_change_text() -> void:
	text = "Score: %.0f" % [Score.score]
