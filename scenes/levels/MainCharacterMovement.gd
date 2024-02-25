extends CharacterBody2D

@export var speed = 400
@export var projectile : PackedScene
@export var rotation_speed = 4.0
@export var fire_rate = 0.5

var last_shot_time = 0.0
var rotation_direction = 0

func shoot():
	var time_since_last_shot = Time.get_ticks_msec() / 1000.0 - last_shot_time
	if time_since_last_shot >= fire_rate:
		var b = projectile.instantiate()
		owner.add_child(b)
		b.transform = $Muzzle2.global_transform
		last_shot_time = Time.get_ticks_msec() / 1000.0
	
func get_input():
	rotation_direction = Input.get_axis("move_left", "move_right")
	velocity = Vector2.UP.rotated(rotation) * Input.get_axis("move_down", "move_up") * speed

func _physics_process(delta):
	get_input()
	rotation += rotation_direction * rotation_speed * delta		
	move_and_slide()
	
	if Input.is_action_pressed("shoot"):
		shoot()
