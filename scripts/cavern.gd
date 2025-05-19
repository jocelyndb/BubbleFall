extends Node2D

@export var bubbleSpawnDelay:float = 0.3
@export var maxbubbleSpawnDelay:float = 0.45


var packedbubble:PackedScene = preload("res://scenes/bubble.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_spawn_bubble(GameData.VIEWPORT.x / 2,
				GameData.VIEWPORT.y / 4,
				5)
	_spawn_bubble(GameData.VIEWPORT.x / 2 - 50,
				GameData.VIEWPORT.y / 2 + 150,
				4.9)
	_spawn_bubble(GameData.VIEWPORT.x / 2 + 50,
				GameData.VIEWPORT.y * 3 / 4,
				5.1)
	_spawn_bubble(GameData.VIEWPORT.x / 2,
				GameData.VIEWPORT.y / 2,
				5.2)
	$bubbleSpawn.start(bubbleSpawnDelay)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# spawn bubbles
	#print(get_children().size())
	
	pass
	
func _physics_process(delta: float) -> void:
	bubbleSpawnDelay = move_toward(bubbleSpawnDelay, maxbubbleSpawnDelay, .01 * delta)
	#print(bubbleSpawnDelay)


func _on_bubble_spawn_timeout() -> void:
	_spawn_bubble(randf_range(-20,GameData.VIEWPORT.x + 20),
				GameData.VIEWPORT.y + 100,
				randf_range(5, 6))
	#print("Added a bubble")
	$bubbleSpawn.start(randf_range(bubbleSpawnDelay * .8, bubbleSpawnDelay * 1.2))
	pass # Replace with function body.


func _spawn_bubble(x: float, y: float, mod: float) -> void:
	var child_node = packedbubble.instantiate()
	child_node.scale *= mod
	child_node.fallSpeed /= mod
	child_node.position.y = y
	child_node.position.x = x
	add_child(child_node)
	pass
