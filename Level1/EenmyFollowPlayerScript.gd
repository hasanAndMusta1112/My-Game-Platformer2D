extends KinematicBody2D


var speed = 80
var g = 10
onready var player = get_node("/root/World/Player")



func _physics_process(delta):
	if player:
		var dir = (player.position - position).normalized()
		move_and_slide(dir * speed)


func _on_Area2D_body_entered(body):
	if body is Player:
		get_tree().reload_current_scene()
	pass # Replace with function body.
