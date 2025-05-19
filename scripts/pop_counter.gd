extends Label

var popCount: int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	popCount = 0
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _popped() -> void:
	#print("popped!")
	popCount += 1
	text = "Popped: %d" % popCount
	pass
