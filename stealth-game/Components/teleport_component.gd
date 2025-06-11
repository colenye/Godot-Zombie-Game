extends Node

@export var teleportDistance : float = 500
@export var body : CharacterBody2D
@export var teleportPreview : PackedScene = load("res://Scenes/TeleportPreview.tscn")

var canTele = true
var mousePos
var instance
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if body:
		instance = teleportPreview.instantiate()
		instance.visible = false
		body.add_child.call_deferred(instance)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if body and canTele:
		mousePos = get_viewport().get_mouse_position()
		var tele = (mousePos - body.global_position).normalized() * teleportDistance
		
		if Input.is_action_pressed("ability1"):
			instance.visible = true
			if mousePos.distance_to(body.global_position) > tele.length():
				instance.global_position = body.global_position + tele
			else:
				instance.global_position = mousePos
		if Input.is_action_just_released("ability1"):
			$Timer.start()
			canTele = false


func _on_timer_timeout() -> void:
	if body:
		var tele = (mousePos - body.global_position).normalized() * teleportDistance
		instance.visible = false
		if mousePos.distance_to(body.global_position) > tele.length():
			body.global_position += tele
		else:
			body.global_position = mousePos
	canTele = true
