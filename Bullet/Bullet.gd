#this code will allow the bullet to move and collied with the border or enemy



extends KinematicBody2D

var speed = 500       #speed of the bullet



func _ready():
	GlobalVariables.enemyBulletInstanceCount += 1
	set_physics_process(true)

func _physics_process(delta):              #give the physics to the bullet 
	var collidedObject = move_and_collide(Vector2(0, -speed*delta)) #allows the bullet to move 
	if (collidedObject):
		print(collidedObject.collider.name)
		if "Enemy" in collidedObject.collider.name:   #when bullet hits enemy remove that enemy
			collidedObject.get_collider().queue_free()
			GlobalVariables.scoringinformation["currentScore"] +=10 #when enemy is removed add 10 the curret score  
		queue_free()


