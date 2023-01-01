extends StaticBody2D


func _ready():
	pass





func _on_Area2D_body_entered(body):
	if body is Player:
		get_tree().reload_current_scene()
	pass # Replace with function body.
