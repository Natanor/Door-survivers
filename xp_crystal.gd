class_name XPCrystal
extends Node2D

var acceleration = 100
var velocity = Vector2(0, 0)
var player: Player = null
var xp = 10

const my_scene: PackedScene = preload("res://XP crystal.tscn")

func _process(delta):
	var distance = (player.position - position).length()
	velocity += (player.position - position).normalized() * (acceleration / log(distance))
		
	if velocity.length() > 0:
		position += velocity * delta
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop()
		
func hit_by_player(player: Player):
	self.queue_free()

static func drop_XP(player: Player, amount: int, position: Vector2) -> XPCrystal:
	var xp: XPCrystal = my_scene.instantiate()
	xp.player = player
	xp.xp = amount
	xp.position = position
	return xp
