extends Node2D

@export var spawn_distance = 500

@onready var player: Player = self.get_parent()
var time_since_start = 0


func spawn_enemy():
	var position = player.position + Vector2.DOWN.rotated(randf_range(-1 * PI, PI)) * spawn_distance
	
	var enemyToSpawn = Enemy.new_enemy(player, position, EnemyType.NORMAL)
	get_node('/root/Main/EnemyHolder').add_child(enemyToSpawn)

func _physics_process(delta: float) -> void:
	if time_since_start % 60 == 10:
		self.spawn_enemy()
	
	time_since_start +=1
