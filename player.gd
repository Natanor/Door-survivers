class_name Player
extends Node2D

@export var speed = 400 # How fast the player will move (pixels/sec).
var screen_size # Size of the game window.
var xp = 0
var health = 100
func _ready():
	screen_size = get_viewport_rect().size

func _process(delta):
	var velocity = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")

	if Input.is_action_pressed("ui_up"):
		get_tree().root.get_child(0).add_child(Enemy.new_enemy(self, 100, 100))
	
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed

		position += velocity * delta
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop()

func get_xp(amount: int):
	xp += amount
	# print(xp)
	
func take_damage(amount: int):
	health -= amount
	print(health)
	
func _physics_process(delta: float) -> void:
	for area : Area2D in $Area2D.get_overlapping_areas():
		if area.get_parent().has_method("hit_by_player"):
			area.get_parent().hit_by_player();
