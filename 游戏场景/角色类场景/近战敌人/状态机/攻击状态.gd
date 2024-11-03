extends Base_State
@onready var a1=$"../../AttackCheck/A1"
@onready var timer=$Timer
@onready var ani=$"../../AnimationPlayer"
func enter():
	print("enter atk")
	ani.play("atk1")
	print("atk is played")
		
	
func do():
	pass
	
func atk_check():
	var arr=a1.get_overlapping_bodies()

func atk2r_check():
	pass




func _on_animated_sprite_2d_animation_finished():
	get_parent().change_state(0)
