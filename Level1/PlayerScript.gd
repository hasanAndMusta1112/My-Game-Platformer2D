extends KinematicBody2D


class_name Player
const speed = 120
const g = 10
const jump = -200
const UP = Vector2(0,-1)
var jump_count = 0
export var extra_jumps = 1
export var climbing = false

var m = Vector2()


func _process(delta):
	Void()
	pass

func _physics_process(delta):
	if climbing == false:
		m.y += g
	elif climbing == true:
		m.y = 0
		if Input.is_action_pressed("ui_down"):
			m.y = speed
		elif Input.is_action_pressed("ui_up"):
			m.y = -speed
	if Input.is_action_pressed("ui_right"):
		m.x = speed
		$Sprite.flip_h = false
		$AnimationPlayer.play("Run")
	elif Input.is_action_pressed("ui_left"):
		m.x = -speed
		$Sprite.flip_h = true
		$AnimationPlayer.play("Run")
	elif Input.is_action_pressed("ui_select"):
		$AnimationPlayer.play("Hit")
	else :
		m.x = 0
		$AnimationPlayer.play("Idle")
	
	if Input.is_action_just_pressed("ui_up") and jump_count < extra_jumps:
		m.y = jump
		jump_count += 1
	
	
	if is_on_floor():
		jump_count = 0
	
	
	
	m = move_and_slide(m,UP)


func Void():
	if global_position.y > 600:
		get_tree().reload_current_scene()
	pass




func _on_Area2D_body_entered(body):
	pass # Replace with function body.
