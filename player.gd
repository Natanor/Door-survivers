extends Node2D

@export var speed = 400 # How fast the player will move (pixels/sec).
var screen_size # Size of the game window.

func _ready():
	screen_size = get_viewport_rect().size

func _process(delta):
	var velocity = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	
	prints(velocity)
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed

		position += velocity * delta
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop()
