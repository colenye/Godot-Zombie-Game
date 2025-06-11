extends Node

class_name HealthComponent
@export var health : float
@export var body : Node2D
@onready var initialHealth = health

func damage(damageAmount: float) -> void:
	health -= damageAmount
	if health <= 0:
		body.queue_free()

func addHealth(amount: float) -> void:
	health += amount
	if (health > initialHealth):
		health = initialHealth
