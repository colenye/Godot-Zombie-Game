extends Area2D

@onready var anim = $AnimatedSprite2D
@export var health = 100
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	anim.play("idle")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
