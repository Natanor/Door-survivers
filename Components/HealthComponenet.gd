class_name HealthComponent
extends Node

signal health_changed
signal died


@export var startingHealth = 100
@export var maxHealth = 100

var hasDied = false

var currentHealth = startingHealth:
	get:
		return currentHealth
	set(value):
		var oldHealth = currentHealth
		currentHealth = value
		var diffrence = currentHealth - oldHealth
		health_changed.emit(diffrence, oldHealth, currentHealth)
		if !hasDied and currentHealth <= 0:
			died.emit()



func take_damage(amount : int):
	currentHealth -= amount
