#this code is all of the code that effcts the play 
#movement
#shooting

extends KinematicBody2D

var movement_speed = 500 #player speed 
var bulletSource = preload ("res://Bullet/Bullet.tscn")
func _ready():
	set_process(true)
	set_physics_process(true)




func _physics_process(delta):
	if Input.is_action_pressed("ui_left"):   #when the left arrow key is pressed go left on the screen
		if position.x > 10:                   
			move_and_collide(Vector2(-movement_speed * delta, 0)) #allows you go left
	if Input.is_action_pressed("ui_right"):    #when you press the right arowor go right on the screen 
		if position.x < 1250:
			move_and_collide(Vector2(movement_speed * delta, 0))     #allows you to go right 


func _process(delta):
	if Input.is_action_just_pressed("fire"):       #when you press the fire button shoot a bullet 
		var bulletInstance = bulletSource.instance()
		bulletInstance.position = Vector2(position.x+25, position.y-20) #tells the bullet what derction to go in 
		get_tree().get_root().add_child(bulletInstance)       # creat a bullet 

