extends Node2D

@export var player : Node2D
@export var bullet : PackedScene
@export var bulletHolder : Node2D
var level = 0

@export var rateByLevel = Array([], TYPE_INT, "int", null)

func shoot() :
	bulletHolder.add_child(bullet.instantiate())
