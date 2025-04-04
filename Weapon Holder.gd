extends Node2D

@export var doors = Array([], TYPE_OBJECT, "Node", null)
@export var doorLimit : int = 0

func _addDoor(door):
	if doors.has(door) :
		#upgrade door level
		pass
	else:
		if doors.size() < doorLimit :
			doors[doors.size() - 1] = door;
