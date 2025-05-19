extends Node2D

@export var fallSpeed:float = 20
@export var popTime:float = 0.1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _physics_process(delta: float) -> void:
	if position.y < -50: queue_free()
	if randf() < 0.0002: pop()
	position.y -= fallSpeed



func _on_body_entered(body: Node2D) -> void:
	##print ("%d %d" % [body.global_position.y, global_position.y])
	#if body.position.y + body.scale.y + 20 > position.y - scale.y:
		#draw_rect(Rect2(body.position, Vector2(5,5)), Color.GREEN, true, 1)
		#draw_rect(Rect2(position, Vector2(5,5)), Color.RED, true, 1)
		#print("Spotted!")
	get_tree().call_group("bubbleListeners", "_popped")
	pop()
	#$popTimer.start(popTime)
	pass # Replace with function body.
#
#func _on_pop_timer_timeout() -> void:
	#pop()
	#pass # Replace with function body.


func pop() -> void:
	$AnimatedSprite2D.play("pop")

func _on_animated_sprite_2d_animation_finished() -> void:
	get_tree().call_group("bubbleListeners", "_pop_finished")
	queue_free()
	pass # Replace with function body.
