# this code will control most things that hppen in the game 
# timer 
# scores 
# a button to get back the menu 


extends Control

export(int) var countdownmax
var currentTimer


func _ready():
	set_process(true)
	currentTimer = countdownmax
	$HUD/Countdown.text = str(currentTimer)
	for button in $HUD/buttons.get_children():
		button.connect("pressed", self, "_on_Button_pressed", [button.scene_to_load])
	while currentTimer > 0:
		yield(get_tree().create_timer(1.0), "timeout")
		$HUD/Countdown.text = str(currentTimer)
		currentTimer = currentTimer - 1
		print(currentTimer)
	print("gameover")
	GlobalVariables.currentscore.push_front (GlobalVariables.scoringinformation["currentScore"])
	print (GlobalVariables.currentscore)
	get_tree().change_scene("res://lose scene/you lost.tscn")

func _process(delta):
	$HUD/Currentscore.text = str(GlobalVariables.scoringinformation["currentScore"])
	if get_tree().get_nodes_in_group("enemy").size() == 0:
		get_tree().change_scene("res://you win/you win scene.tscn")


func _on_Button_pressed(scene_to_load):
	print("Changing Scene...")
	print(scene_to_load)
	get_tree().change_scene(scene_to_load)
