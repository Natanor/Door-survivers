extends Node2D

@export var velocity : int = 0
@export var baseDamage : int = 0
var level : int = 0

@export var rateByLevel = Array([], TYPE_INT, "int", null)
@export var sizeByLevel = Array([], TYPE_INT, "int", null)

var enemyHolder : Node2D = null
var target :Node2D = null

func _initialize (doorLevel) :
	level = doorLevel
	enemyHolder = $"../../../EnemyHolder"
	return;

func _process(delta):
	if target == null :
		find_target()
	follow_target(delta)
	return;
	
func find_target():
	return

func follow_target(delta):
	return
