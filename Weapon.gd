class_name Weapon
extends Node

var spawnRateInFrames = 3
var time_since_last_trigger = 1

# Initialization
@onready var gameManager : GameManager = get_node('/root/Main/GameManager')

func trigger(delta: float) -> void:
	if time_since_last_trigger <= 0:
		self.spawn()
		time_since_last_trigger = spawnRateInFrames
	time_since_last_trigger -= 1

func spawn():
	gameManager.add_bullet(Bullet.create(10))
