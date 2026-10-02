extends CanvasLayer


static var score = 0

func _enter_tree() -> void:
	score = 0
	$Label.text = ""

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	score += 0.05
	$Label.text = "Score: %.0f" % [score]
