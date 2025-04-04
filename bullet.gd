class_name Bullet
extends Node2D

@export var velocity : int = 2000
var baseDamage : int = 0
var level : int = 0
var direction = Vector2(1,0)

@export var sizeByLevel = Array([], TYPE_INT, "int", null)
var target: Enemy = null

# Initialization
@onready var gameManager : GameManager = get_node("/root/Main/GameManager")
@onready var player : Player  = gameManager.get_player()

const bullet_scene: PackedScene = preload("res://bullet.tscn")
	
func _ready() -> void:
	position = player.position
	find_target()

func _process(delta):
	if !target:
		find_target()
	
	if target :
		follow_target(delta)
	return;
	
func find_target():
	var enemies = gameManager.get_enemies()
	if enemies.size() == 0:
		return
	var closestEnemy = enemies [0]
	for enemy : Node2D in enemies :
		if position.distance_to(closestEnemy.position) > position.distance_to(enemy.position) :
			closestEnemy = enemy;
	target = closestEnemy;
	return

func follow_target(delta):
	if is_instance_valid(target):
		direction = -(position - target.position).normalized()
	position = position + (direction * velocity * delta)
	rotation = direction.angle()
	return


func _on_area_2d_area_entered(area: Area2D) -> void:
	var hit_area = area.get_parent()
	if hit_area is Enemy:
		(hit_area as Enemy).take_damage(baseDamage)
		self.queue_free()

static func create(power: int) -> Bullet:
	var bullet: Bullet = bullet_scene.instantiate()
	bullet.baseDamage = power

	return bullet
