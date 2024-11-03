class_name State_Manager
extends Node

@onready var states_array:Array=get_children()
@onready var current_state:Base_State=$Run


func _ready():
	current_state.enter()

func _physics_process(delta):
	current_state.do()
	
func  change_state(id:int)->void:
	current_state.exit()
	current_state=states_array[id]
	current_state.enter()
