extends KinematicBody2D

var speed = 65 
var m = Vector2()
var g = 10
var dir = -1


func _physics_process(delta):
	m.y += g
	m.x = speed * dir
	
	if is_on_wall():
		m.x = -m.x
		dir *= -1
		$Sprite.flip_h = !$Sprite.flip_h
	if !$left.is_colliding():
		m.x = - m.x
		dir *= -1
		$Sprite.flip_h = !$Sprite.flip_h
	if !$right.is_colliding():
		m.x = - m.x
		dir *= -1
		$Sprite.flip_h = !$Sprite.flip_h
	m = move_and_slide(m,Vector2.UP)
	pass


func _on_Died_body_entered(body):
	if body is Player:
		get_tree().reload_current_scene()
	pass # Replace with function body.
