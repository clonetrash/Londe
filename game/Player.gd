extends KinematicBody

onready var cam = get_node(campath) 
export (NodePath) var campath 
export (float) var speed
var input = Vector3 ()


func _ready():
#	set_process(true)
	set_process_input(true)
	set_fixed_process(true)
	
	pass
#func _process(delta):
	
func _input(event):
	if event.is_action_pressed("ui_right"):
		input.x=1
	if event.is_action_pressed("ui_left"):
		input.x=-1 
		
	if event.is_action_released("ui_right"):
		input.x=0
	if event.is_action_released("ui_left"):
		input.x=0 
		
	if event.is_action_pressed("ui_down"):
		input.y=1
	if event.is_action_pressed("ui_up"):
		input.y=-1 
		
	if event.is_action_released("ui_down"):
		input.y=0
	if event.is_action_released("ui_up"):
		input.y=0 
		
	if event.is_action_pressed("ui_accept"):
		input.z=6
	if event.is_action_released("ui_accept"):
		input.z=-6

func _fixed_process(delta):
	move(Vector3 (input.x, input.z, input.y) * delta * speed)