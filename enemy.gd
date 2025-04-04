class_name Enemy
extends Node2D

@export var speed = 100 # How fast the player will move (pixels/sec).
@export var health = 100
@export var damage = 10
@export var xp = 10
@export var player: Node2D

const my_scene: PackedScene = preload("res://enemy.tscn")

func _process(delta):
	var velocity = (player.position - position).normalized()
	self.take_damage(1)
	
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed

		position += velocity * delta
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop()

func take_damage(amount):
	health -= amount
	if health < amount:
		self.die()

func die():
	get_tree().root.get_child(0).add_child(XPCrystal.drop_XP(self.player, xp, self.position))
	self.queue_free()
	
func hit():
	pass
	
static func new_enemy(player: Player, speed := 50.0, health := 100, xp := 10) -> Enemy:
	var new_enemy: Enemy = my_scene.instantiate()
	new_enemy.health = health
	new_enemy.speed = speed
	new_enemy.player = player
	new_enemy.xp = xp
	return new_enemy
