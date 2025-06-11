extends Node2D

@onready var player = $"../Player1"
@export var SPEED = 20


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	for c in $".".get_children():
		var direction = (player.position - c.position).normalized()
		c.velocity = direction * SPEED
