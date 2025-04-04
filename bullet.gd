extends Node2D

@export var velocity : int = 0
@export var baseDamage : int = 0
var level : int = 0

@export var sizeByLevel = Array([], TYPE_INT, "int", null)

var enemyHolder : Node2D = null
var target :Node2D = null

func _initialize (weaponLevel) :
	level = weaponLevel
	enemyHolder = $"../../../EnemyHolder"
	return;

func _process(delta):
	if target == null :
		find_target()
	follow_target(delta)
	return;
	
func find_target():
	var enemies = enemyHolder.get_children()
	var closestEnemy = enemies [0]
	for enemy : Node2D in enemies :
		if position.distance_to(closestEnemy.position) > position.distance_to(enemy.position) :
			closestEnemy = enemy;
	target = closestEnemy;
	return

func follow_target(delta):
	var direction = (position - target.positon).normalize()
	position = position + (direction * velocity * delta)
	return


func _on_area_2d_area_entered(area: Area2D) -> void:
	pass # Replace with function body.
