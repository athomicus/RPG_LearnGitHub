extends KinematicBody2D
#comit changest Test 05/02/2023 - Ar2r
const ACCELERATION = 10
const FRICTION = 50 # lower friction = more glide (ślizg) / mniejsze tarcie

const MAX_SPEED = 40
var velocity = Vector2.ZERO
onready var _animated_sprite = $AnimatedSprite
onready var _animationTree = $AnimationTree
onready var _animationState = _animationTree.get("parameters/playback")
	

func _physics_process(delta):
	
	var input_vector =  Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized()
	
	#below this  when our player moving:
	if input_vector != Vector2.ZERO:
		_animationTree.set("parameters/Idle/blend_position",input_vector)
		_animationTree.set("parameters/Run/blend_position",input_vector)
		_animationState.travel("Run")
		velocity = velocity.move_toward(input_vector * MAX_SPEED,ACCELERATION * delta )
	else: #and when we no moving
		_animationState.travel("Idle")  #_animated_sprite.play("Idle")
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
	
	move_and_collide(velocity)		
		
