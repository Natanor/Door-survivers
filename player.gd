class_name Player
extends Node2D

@export var speed = 400 # How fast the player will move (pixels/sec).
@export var health = 100
@export var collected_xp = 0

@onready var screen_size = get_viewport_rect().size # Size of the game window.


@export_group("XP")
@export var max_xp_pull_distance = 125
@export var xp_pull_strength = 100000

# Initialization
@onready var gameManager : GameManager = get_node('/root/Main/GameManager')

func _process(delta):
	var velocity = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	
	if Input.is_action_just_pressed("ui_accept"):
		gameManager.add_bullet(Bullet.new())
	
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed

		position += velocity * delta
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop()

func get_xp(amount: int):
	collected_xp += amount
	# print(xp)
	
func take_damage(amount: int):
	health -= amount
	print(health)
	
func _physics_process(delta: float) -> void:
	for area : Area2D in $Area2D.get_overlapping_areas():
		if area.get_parent().has_method("hit_by_player"):
			area.get_parent().hit_by_player();
