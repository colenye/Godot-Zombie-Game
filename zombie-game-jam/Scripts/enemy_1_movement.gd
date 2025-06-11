extends CharacterBody2D

@export var health = 1000

func _physics_process(delta: float) -> void:
	if self.get_meta("alive"):
		move_and_slide()


func _on_animated_sprite_2d_animation_finished() -> void:
	queue_free()
