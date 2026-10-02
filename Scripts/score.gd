extends CanvasLayer

static var score = 0

func _ready() -> void:
	score = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	score += 0.05
	$Label.text = "Score: %.0f" % [score]
