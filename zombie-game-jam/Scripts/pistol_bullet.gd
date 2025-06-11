extends CharacterBody2D


@export var SPEED = 1000
@export var DAMAGE = 25
@export var zombieSpeedMultipliers = [2, 4, 6]
var pos: Vector2
var dir: float
@onready var bulletImpact = load("res://Scenes/Bullets/Bullet_Impact.tscn")
@onready var main = get_tree().get_root()


func _ready() -> void:
	global_position = pos
	global_rotation = dir
	
func _physics_process(delta: float) -> void:
	velocity = Vector2(SPEED, 0).rotated(dir)
	move_and_slide()

func createImpact():
	var bullInstance = bulletImpact.instantiate()
	bullInstance.global_position = global_position
	bullInstance.play("Impact")
	main.add_child.call_deferred(bullInstance)

func _on_area_2d_area_shape_entered(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	$Area2D.kill(area, area_shape_index, DAMAGE, "death1")
		
