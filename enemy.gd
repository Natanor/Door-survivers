class_name Enemy
extends Node2D

@export var speed = 100 # How fast the player will move (pixels/sec).
@export var health = 100
@export var damage = 10
@export var xp = 10
@export var player: Node2D
@export var DAMAGE_COOLDOWN_SECONDS = 0.5

var damage_cooldown = 0

# Initialization
@onready var gameManager : GameManager = get_node('/root/Main/GameManager')
const my_scene: PackedScene = preload("res://enemy.tscn")


func _process(delta):
	var velocity = (player.position - position).normalized()
	rotation = velocity.angle()

	if velocity.length() > 0:
		velocity = velocity.normalized() * speed

		position += velocity * delta
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop()

func take_damage(amount):
	print("OUCH")
	health -= amount
	if health < amount:
		self.die()

func die():
	gameManager.drop_xp(XPCrystal.drop_XP(self.player, xp, self.position))
	self.queue_free()
	
func hit_by_player():
	if( damage_cooldown <= 0):
		player.take_damage(damage)
		damage_cooldown = DAMAGE_COOLDOWN_SECONDS * 60
	
func _physics_process(delta: float) -> void:
	if damage_cooldown > 0:
		damage_cooldown -= 1
	
static func new_enemy(player: Player, position: Vector2, enemyType: int) -> Enemy:
	var new_enemy: Enemy = my_scene.instantiate()
	new_enemy.player = player
	new_enemy.position = position

	var params = EnemyType.getEnemyInfo(enemyType)
	new_enemy.health = params.health
	new_enemy.speed = params.speed
	new_enemy.xp = params.xp
	return new_enemy
