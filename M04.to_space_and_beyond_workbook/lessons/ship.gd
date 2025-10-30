extends Sprite2D
var normal_speed := 600.0
var boost_speed := 1500.0
var max_speed := normal_speed
var velocity := Vector2(0,-0)

#true for all the code
func _process(delta: float) -> void:
	
	if Input.is_action_just_pressed("boost"):
		max_speed = boost_speed
		get_node("Timer").start()
	# boost using space
	var direction := Vector2(0,0)
	direction.x = Input.get_axis("move_left","move_right")
	direction.y = Input.get_axis("move_up","move_down")
	if direction.length()>1.0:
		direction=direction.normalized()
	#moving sprite with wsad
	
	velocity = direction * max_speed
	position += velocity * delta
	if direction.length() > 0.0:
		rotation = velocity.angle()
	#turning along with whichever direction you are moving 


func _on_timer_timeout() -> void:
	max_speed = normal_speed
#After a set amount of time speed of spaceship goes back to normal
