extends CharacterBody2D

signal died

const SPEED = 500.0
const MOVE_DAMPING = 1200.0
const ROTATE_DAMPING = 1.0
const ANGLE = PI / 3
const JUMP_VELOCITY = -400.0

@export var maxFallVelocity:float = 3


func _ready() -> void:
	position.x = GameData.VIEWPORT.x / 2
	#position.y = GameData.VIEWPORT.y / 2
	position.y = 0

func _physics_process(delta: float) -> void:
	## Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
#
	# Handle jump.
	#if Input.is_action_just_pressed("ui_accept") and is_on_floor():
	if is_on_floor():
		velocity.y = JUMP_VELOCITY
		
	## Push player to center of screen vertically
	#if position.y < GameData.VIEWPORT.y / 2:
		#velocity.y = (GameData.VIEWPORT.y / 2 - position.y) * maxFallVelocity
		##velocity.y = move_toward(velocity.y, maxFallVelocity, delta * SPEED)

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		rotation += direction * delta
		velocity.x = direction * SPEED
		
	else:
		velocity.x = move_toward(velocity.x, 0, delta * MOVE_DAMPING)
		rotation = move_toward(rotation, 0, delta * ROTATE_DAMPING)

	move_and_slide()
		
	if position.x < scale.x:
		position.x = scale.x
	elif position.x > GameData.VIEWPORT.x - scale.x:
		position.x = GameData.VIEWPORT.x - scale.x
	
	if position.y > GameData.VIEWPORT.y + scale.y:
		emit_signal("died")
		queue_free()
