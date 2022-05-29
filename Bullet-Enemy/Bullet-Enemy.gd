#this codes is what makes the enemy bullets shoot and work




extends KinematicBody2D

var speed = 500  #speed of the bullet             


func _ready():
	GlobalVariables.enemyBulletInstanceCount += 1 #adds one bullet to the game  
	set_physics_process(true) # gives the bullet physics 


func _physics_process(delta):
	var collidedObject = move_and_collide(Vector2(0, +speed*delta*0.4)) # tells thge bullet what diurection to go in 
	if (collidedObject):
		
		if "Enemy" in collidedObject.collider.name:
			pass
			#collidedObject.get_collider().queue_free() #Don't kill the enemies.
		else:
			queue_free()
			GlobalVariables.enemyBulletInstanceCount -= 1
			print("Enemy Bullets: ", GlobalVariables.enemyBulletInstanceCount)
