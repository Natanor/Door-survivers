extends Area2D
class_name Hitbox

@export var damage: int = 10
@export var team: String = "player"  # optional, useful for friendly fire logic
@export var knockback_force: Vector2 = Vector2.ZERO

signal hit(target: Hurtbox)

func _ready() -> void:
	area_entered.connect(_on_area_entered)

func _on_area_entered(area: Area2D) -> void:
	print("AAAAAAAA")
	if area is Hurtbox:
		print("BBBBB")
		area.hurt.emit(damage)
		hit.emit(area)
