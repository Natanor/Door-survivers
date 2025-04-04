class_name Enemy
extends Node2D

@export var speed = 100 # How fast the player will move (pixels/sec).
@export var health = 100
@export var damage = 10
@export var player: Node2D

const my_scene: PackedScene = preload("res://enemy.tscn")

func _process(delta):
	var velocity = (player.position - position).normalized()
	
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed

		position += velocity * delta
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop()


static func new_enemy(player: Player, speed := 50.0, health := 100) -> Enemy:
	var new_enemy: Enemy = my_scene.instantiate()
	new_enemy.health = health
	new_enemy.speed = speed
	new_enemy.player = player
	return new_enemy
