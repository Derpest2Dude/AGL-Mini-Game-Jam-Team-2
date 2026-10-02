extends CanvasLayer

static var score = 0
signal change_text

func _enter_tree() -> void:
	score = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	score += 0.05
	change_text.emit()
