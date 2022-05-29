extends KinematicBody2D

var bullet = preload("res://Bullet-Enemy/Bullet-Enemy.tscn")    #loads enemy bullet


	
func _ready():
	$Area2D.connect("area_entered", self, "_colliding") #tell the enemyes to stay in the play area
	

func _colliding(area):
	if area.is_in_group("right"):
		#print("emenies collide right")
		get_parent().global_position.y += 10
		get_parent().speed = -200 #speed of the enemy of when going right
	if area.is_in_group("left"):
		#print("emenies collide left")
		get_parent().global_position.y += 10
		get_parent().speed = 200  #speed of the enemys when going left


func _process(delta):
#	while (true):
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	var my_random_number = rng.randf_range(2.0, 30.0) #the numeber selected is what enemy will soot a bullet 
	#print("time: ",my_random_number)
	yield(get_tree().create_timer(my_random_number), "timeout")
	if GlobalVariables.enemyBulletInstanceCount < 5:          #there can only be 5 enemy bullets on screen
		var bulletInstance = bullet.instance()
		
		bulletInstance.position = Vector2(global_position.x, global_position.y+20) #what derection the bullet will travil 
		get_tree().get_root().add_child(bulletInstance)
