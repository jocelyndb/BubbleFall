extends HBoxContainer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_left_button_down() -> void:
	Input.action_release("ui_right")
	Input.action_press("ui_left")

func _on_left_button_up() -> void:
	Input.action_release("ui_left")


func _on_right_button_down() -> void:
	Input.action_release("ui_left")
	Input.action_press("ui_right")

func _on_right_button_up() -> void:
	Input.action_release("ui_right")
