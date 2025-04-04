class_name GameManager
extends Node


@onready var player: Player = get_node('/root/Main/Player')

func _ready() -> void:
	$"Weapon Holder"._addWeapon(Weapon.new())

func add_enemy(enemy: Enemy):
	$EnemyHolder.add_child(enemy)
	
func drop_xp(xpCrystal : XPCrystal):
	$XPHolder.add_child(xpCrystal)

func get_player():
	return player
	
func add_bullet(bullet: Bullet):
	$"Bullet Holder".add_child(Bullet.create(10))
	
func get_enemies():
	return $EnemyHolder.get_children()

func _on_createBullet(bullet: Bullet):
	add_bullet(bullet)
