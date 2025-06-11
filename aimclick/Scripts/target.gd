extends Area2D

@export var targetDissapearRate = 0.05
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	scale -= Vector2(targetDissapearRate, targetDissapearRate)
	if (scale.x <= 0 and scale.y <= 0):
		$"../..".misses += 1
		queue_free()


func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT:
			queue_free()
