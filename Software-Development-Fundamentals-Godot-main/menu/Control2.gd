#this code contols what happens on the main menu 
#most of the code here contols what happens when you press a button

extends Control

func _ready():                 #allows everthing to work 
	for button in $"menu/menubuttons/buttons".get_children():    #finds where the button is 
		button.connect("pressed", self, "_on_Button_pressed", [button.scene_to_load])    #when button is pressed load scene 


func _on_Button_pressed(scene_to_load):                         #loads the wanted scene 
	print("Changing Scene...")
	print(scene_to_load)
	get_tree().change_scene(scene_to_load)

