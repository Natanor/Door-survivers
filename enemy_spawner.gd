extends Node

@export var spawn_distance = 500
var time_since_start = 0

# Initialization
@onready var gameManager : GameManager = get_node('/root/Main/GameManager')

func spawn_enemy():
	var player = gameManager.get_player()
	var position = player.position + Vector2.DOWN.rotated(randf_range(-1 * PI, PI)) * spawn_distance
	
	var enemyToSpawn = Enemy.new_enemy(player, position, EnemyType.NORMAL)
	gameManager.add_enemy(enemyToSpawn)

func _physics_process(delta: float) -> void:
	if time_since_start % 60 == 10:
		self.spawn_enemy()
	
	time_since_start +=1
