extends Node2D

var rng = RandomNumberGenerator.new()
@onready var Enemies = $Entities/Enemies
@onready var Pickups = $Pickups
@onready var enemy1 = load("res://Scenes/Characters/Enemies/Enemy1.tscn")
@onready var enemy2 = load("res://Scenes/Characters/Enemies/Enemy2.tscn")
@onready var pistolammo = load("res://Scenes/Pickups/PistolAmmo.tscn")
@onready var rocketAmmo = load("res://Scenes/Pickups/RocketAmmo.tscn")
@export var zombieSpawnAmount = 0
@export var pistolSpawnAmount = 20
@export var rocketSpawnAmount = 20
# Called when the node enters the scene tree for the firdst time.
func _ready() -> void:
	rng.randomize()
	for c in range(zombieSpawnAmount):
		var enemy1Inst = enemy1.instantiate()
		var x = rng.randi_range(-1600, 1600)
		var y = rng.randi_range(-1600, 1600)
		enemy1Inst.global_position.x = x
		enemy1Inst.global_position.y = y
		Enemies.add_child.call_deferred(enemy1Inst)
	for c in range(pistolSpawnAmount):
		var pistolAmmoInst = pistolammo.instantiate()
		var x = rng.randi_range(-800, 800)
		var y = rng.randi_range(-800, 800)
		pistolAmmoInst.global_position.x = x
		pistolAmmoInst.global_position.y = y
		Pickups.add_child.call_deferred(pistolAmmoInst)
	for c in range(rocketSpawnAmount):
		var rocketAmmo = rocketAmmo.instantiate()
		var x = rng.randi_range(-800, 800)
		var y = rng.randi_range(-800, 800)
		rocketAmmo.global_position.x = x
		rocketAmmo.global_position.y = y
		Pickups.add_child.call_deferred(rocketAmmo)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_enemies_child_exiting_tree(node: Node) -> void:
	if $Entities/Enemies.get_child_count() <= 1:
		get_tree().change_scene_to_file.call_deferred("res://Scenes/Areas/Menu.tscn")
