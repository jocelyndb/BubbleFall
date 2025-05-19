extends Label


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if GameData.justPlayed:
		text = "Last Score: %d" % GameData.lastScore
	else: queue_free()
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
