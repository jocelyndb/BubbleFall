extends Node2D

enum gameState {MENU, START, PLAYING, DEATH}

var state: gameState

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	state = gameState.START
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#print(Input.get_accelerometer()
	pass

#func _getState() -> 


func _on_player_died() -> void:
	#$deathPlayer.play(0.0)
	$deathPlayer.play()
	#print("should be playing")
	GameData.justPlayed = true
	GameData.lastScore = $HBoxContainer/popCounter.popCount
	Input.action_release("ui_left")
	Input.action_release("ui_right")
	pass # Replace with function body.

func _on_death_player_finished() -> void:
	#print("should change scene")
	GameData.highScore = max($HBoxContainer/popCounter.popCount, GameData.highScore)
	GameData.save_data()
	get_tree().change_scene_to_file("res://scenes/menu.tscn")
	pass # Replace with function body.
