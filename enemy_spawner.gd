extends Node2D

var player = self.get_parent()
var time_since_start = 0


func spawn_enemy():
	Enemy.new_enemy(player, 50, 100, 10)

func _physics_process(delta: float) -> void:
	for area : Area2D in $Area2D.get_overlapping_areas():
		if area.get_parent().has_method("hit_by_player"):
			area.get_parent().hit_by_player();
