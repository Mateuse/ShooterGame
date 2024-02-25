extends CharacterBody2D

@export var health = 500
@export var speed = 100
@export var damage = 20
@export var damage_explode = 300

var player = null

func _ready():
	print("HELLO")
	player = get_node("../Character")
	
func handle_collision(collision_info):
	if collision_info.get_collider().name == "Character":
		queue_free()
	
func _physics_process(delta):
	if player:
		var direction = (player.global_position - global_position).normalized()
		velocity = direction * speed
		var collision = move_and_collide(velocity * delta)
		if collision:
			handle_collision(collision)
