extends Node2D

@export var player : Node2D
@export var bullet : PackedScene
@export var bulletHolder : Node2D
var level = 0

func shoot() :
	bulletHolder.add_child(bullet.instantiate())
