extends Base_State

@onready var ani:AnimationPlayer=$"../../AnimationPlayer"
@onready var monster:CharacterBody2D=$"../.."
@onready var a1=$"../../AttackCheck/A1"

const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var direct:Vector2=Vector2.RIGHT
var attack:bool=false

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func enter():
	ani.play("run")
	
func do():
	if !is_instance_valid($"../../RightDownCast".get_collider()):
		direct=Vector2.LEFT
		$"../../AnimatedSprite2D".flip_h=true
	elif !is_instance_valid($"../../LeftDownCast2".get_collider()):
		direct=Vector2.RIGHT
		$"../../AnimatedSprite2D".flip_h=false
	var arr:Array=a1.get_overlapping_bodies()
	if !arr.is_empty():
		get_parent().change_state()
		return
	monster.velocity=direct*SPEED
	monster.velocity.y=gravity
	monster.move_and_slide()
