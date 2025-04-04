extends Node
func _addWeapon(weapon: Weapon):
	self.add_child(weapon)

func _physics_process(delta: float) -> void:
	#print(weapons)
	for weapon: Weapon in get_children():
		weapon.trigger(delta)
