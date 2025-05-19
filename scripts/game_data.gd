extends Node

var highScore = 0
var lastScore = 0
var justPlayed = false
#var usedKeyboard = false

var VIEWPORT: Vector2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	VIEWPORT = get_viewport().size
	load_data()
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func save_data() -> void:
	var save_file = FileAccess.open("user://game_data.save", FileAccess.WRITE)
	var json_string = JSON.stringify(highScore)
	print(json_string)
	save_file.store_line(json_string)
	save_file.close()
	
func load_data() -> void:
	if not FileAccess.file_exists("user://game_data.save"):
		print("No saved data found")
		highScore = 0
		return
	var save_file = FileAccess.open("user://game_data.save", FileAccess.READ)
	highScore = JSON.parse_string(save_file.get_line())
	print("Read %d", highScore)
	
