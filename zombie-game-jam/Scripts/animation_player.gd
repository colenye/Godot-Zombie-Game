extends AnimationPlayer

@onready var player = $".."
@onready var anim_sprite = $"../AnimatedSprite2D"
@onready var weapons = $"../Weapons"
@onready var clipBar = $"../UI/HBoxContainer/right/Clip"
var no_skip_anim = false
var facing_right = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	speed_scale = 0.2
	play("run")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("left"):
		if (facing_right):
			anim_sprite.flip_h = false
			facing_right = false
	if Input.is_action_just_pressed("right"):
		if (!facing_right):
			facing_right = true
			anim_sprite.flip_h = true
	if Input.is_action_just_pressed("pistol_equip") and !no_skip_anim:
		
		play("equip gun")
		no_skip_anim = true
		for c in weapons.get_children():
			c.visible = false
		$"../Weapons/Pistol".visible = true
		clipBar.value = $"../Weapons/Pistol".get_meta("clipAmount")
	if Input.is_action_just_pressed("rocket_equip") and !no_skip_anim:
		play("equip rocket")
		no_skip_anim = true
		for c in weapons.get_children():
			c.visible = false
		$"../Weapons/Rocket".visible = true
		clipBar.value = $"../Weapons/Rocket".get_meta("clipAmount")
	if Input.is_action_just_pressed("shoot") and !no_skip_anim:
		for c in weapons.get_children():
			if c.visible and c.get_meta("clipAmount"):
				
				match c.name:
					
					"Knife":
						no_skip_anim = true
						play("attack")
					"Pistol":
						no_skip_anim = true
						play("shoot")
					"Rocket":
						no_skip_anim = true
						play("shoot_rocket")
						
		speed_scale = 1
	if !no_skip_anim:
		if player.velocity == Vector2.ZERO:
			play("idle")
		else:
			play("run")
			
	


func _on_animation_finished(anim_name: StringName) -> void:
	if anim_name == "equip gun" or anim_name == "shoot" or anim_name == "shoot_rocket" or anim_name == "equip rocket":
		no_skip_anim = false
		speed_scale = 0.5
