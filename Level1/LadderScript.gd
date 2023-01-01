extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Ladder_body_entered(body):
	if body.is_in_group("Climber"):
		if body.climbing == false:
			body.climbing = true
	pass # Replace with function body.


func _on_Ladder_body_exited(body):
	if body.is_in_group("Climber"):
		if body.climbing == true:
			body.climbing = false
	pass # Replace with function body.
