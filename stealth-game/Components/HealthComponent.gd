extends Node

class_name HealthComponent

@export var health : float

func damage(attack: Attack):
	health -= attack.damage
