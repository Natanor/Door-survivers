class_name XPCrystal
extends Node2D

var velocity = Vector2(0, 0)
var xp = 10
@export var dampening = 0.9

# Initialization
@onready var gameManager : GameManager = get_node('/root/Main/GameManager')
@onready var player : Player = gameManager.get_player()
const my_scene: PackedScene = preload("res://XP crystal.tscn")

func _process(delta):
	var distance = (player.position - position).length()
	if (distance < player.max_xp_pull_distance):
		velocity += (player.position - position).normalized() * (player.xp_pull_strength / distance**2)
		
	if velocity.length() > 0:
		position += velocity * delta
		velocity *= dampening
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop()
		
func hit_by_player():
	player.get_xp(self.xp)
	self.queue_free()

static func drop_XP(player: Player, amount: int, position: Vector2) -> XPCrystal:
	var xp_instance: XPCrystal = my_scene.instantiate()
	xp_instance.player = player
	xp_instance.xp = amount
	xp_instance.position = position
	return xp_instance
