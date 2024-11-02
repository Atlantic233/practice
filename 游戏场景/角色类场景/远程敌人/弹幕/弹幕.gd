extends Area2D

var vec_x:float=1.0
func _ready():
	self.scale.x=vec_x
	
func _physics_process(delta):
	self.position.x+=vec_x
