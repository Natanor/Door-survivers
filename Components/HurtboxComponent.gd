extends Area2D
class_name Hurtbox

@export var healthComponent: HealthComponent

signal hurt(amount: int)

func _ready() -> void:
	hurt.connect(_on_hurt)

func _on_hurt(amount: int) -> void:
	print("VVVVV")
	healthComponent.take_damage(amount)
