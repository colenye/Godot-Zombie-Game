extends Node2D

@onready var enemy = load("res://Enemies/Enemy 1.tscn")

func _ready() -> void:
	$Timer.start()
func _on_timer_timeout() -> void:
	print("hi")
	var enemyInstance = enemy.instantiate()
	
	add_child(enemyInstance)
