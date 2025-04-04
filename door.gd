extends Node2D

@export var player : Node2D
@export var bullet : PackedScene
var level = 0

@export var rateByLevel = Array([], TYPE_INT, "int", null)
@export var sizeByLevel = Array([], TYPE_INT, "int", null)

func shoot() :
	add_child(bullet.instantiate())
