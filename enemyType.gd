class_name EnemyType
enum {
	NORMAL = 1,
	BOSS = 2
}

static func getEnemyInfo(type: int) -> Dictionary:
	if type == EnemyType.NORMAL:
		return {"health": 50, "speed": 100, "xp": 10}
	if type == EnemyType.BOSS:
		return {"health": 500, "speed": 200, "xp": 10}
	return {}
	
