extends AnimatedSprite2D

@export var speed : float = 3
@export var DAMAGE : float = 30
@onready var main = get_tree().get_root()
func _ready() -> void:
	speed_scale = speed
func _on_animation_finished() -> void:
	queue_free()


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("Zombie"):
		area.get_parent().health -= DAMAGE
