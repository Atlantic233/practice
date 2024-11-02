extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var direct:Vector2=Vector2.RIGHT
var attack:bool=false

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	$AnimatedSprite2D.play("move")
	
	
func _physics_process(delta):
	if !is_instance_valid($RightDownCast.get_collider()):
		direct=Vector2.LEFT
		$AnimatedSprite2D.flip_h=true
	elif !is_instance_valid($LeftDownCast2.get_collider()):
		direct=Vector2.RIGHT
		$AnimatedSprite2D.flip_h=false
	if direct==Vector2.RIGHT&&attack==false:
		if is_instance_valid($RatkCast.get_collider()):
			attack=true
			$AnimatedSprite2D.flip_h=false
			$AnimatedSprite2D.play("atk")
	if direct==Vector2.LEFT&&attack==false:
		if is_instance_valid($LatkCast.get_collider()):
			attack=true
			$AnimatedSprite2D.flip_h=true
			$AnimatedSprite2D.play("atk")
	if attack==true:
		return
	self.velocity=direct*SPEED
	self.velocity.y=gravity
	move_and_slide()


func _on_animated_sprite_2d_frame_changed():
	if $AnimatedSprite2D.animation=="atk":
		if $AnimatedSprite2D.frame==8:
			var sce=preload("res://游戏场景/角色类场景/远程敌人/弹幕/弹幕.tscn").instantiate()
			if direct==Vector2.RIGHT:
				sce.position=$Ratk.global_position
				get_parent().add_child(sce)
			elif direct==Vector2.LEFT:
				sce.position=$Latk.global_position
			sce.vec_x=direct.x
			get_parent().add_child(sce)


func _on_animated_sprite_2d_animation_finished():
	if $AnimatedSprite2D.animation=="atk":
		attack=false
		$AnimatedSprite2D.play("move")

