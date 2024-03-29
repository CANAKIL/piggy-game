extends Area2D

@export_category("Stats")
@export var SPEED: int = 50
var moving = false

@onready var sprite = $Sprite
@onready var animationPlayer = $AnimationPlayer

func _process(delta):
	moving = false
	if Input.is_action_pressed("keyboard_right"):
		move(SPEED, 0, delta)
		sprite.flip_h = false
	if Input.is_action_pressed("keyboard_left"):
		move(-SPEED, 0, delta)
		sprite.flip_h = true
	if Input.is_action_pressed("keyboard_up"):
		move(0, -SPEED, delta)
	if Input.is_action_pressed("keyboard_down"):
		move(0, SPEED, delta)
	
	if moving == true:
		animationPlayer.play("Run")
	else:
		animationPlayer.play("Idle")

func move(xspeed, yspeed, delta):
	position.x += xspeed * delta
	position.y += yspeed * delta
	moving = true


func _on_pig_area_entered(area):
	area.queue_free()
	scale *= 1.1
