extends KinematicBody2D
#comit changest Test 05/02/2023 - Ar2r
const ACCELERATION = 20
const FRICTION = 50
const MAX_SPEED = 50
var velocity = Vector2.ZERO
onready var _animated_sprite = $AnimatedSprite

	
func _physics_process(delta):
	_animated_sprite.play("Idle")
	var input_vector =  Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized()
	if input_vector != Vector2.ZERO:
		velocity = velocity.move_toward(input_vector * MAX_SPEED,ACCELERATION * delta )
	else:
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
	
	move_and_collide(velocity)		
		
