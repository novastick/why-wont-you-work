extends Button

export(String) var scene_to_load


func _on_quit_pressed():
	get_tree().quit()
