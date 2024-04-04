extends LineEdit


# Called when the node enters the scene tree for the first time.
func _ready():
	grab_focus()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _on_LineEdit_text_entered(new_text):
	get_tree().change_scene("res://space_pod.tscn")
