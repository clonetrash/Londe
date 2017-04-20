extends KinematicBody

onready var cam = get_node(campath) 
export (NodePath) var campath 
export (float) var speed
var input = Vector3 ()
var yspeed = 0
var grounded = true 



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
		input.x=min (input.x, 0)
	if event.is_action_released("ui_left"):
		input.x=max (input.x, 0) 
		
	if event.is_action_pressed("ui_down"):
		input.y=1
	if event.is_action_pressed("ui_up"):
		input.y=-1 
		
	if event.is_action_released("ui_down"):
		input.y=min (input.y, 0)
	if event.is_action_released("ui_up"):
		input.y=max (input.y, 0)
		
	if event.is_action_pressed("ui_select") && grounded:
		yspeed=3
		grounded = false
	if event.is_action_released("ui_select"):
		input.z=-6


func _fixed_process(delta):
	yspeed += -10 * (delta)
	var remainder = move(Vector3 (input.x, yspeed, input.y) * delta * speed)
	if is_colliding():
		grounded = true
		var normal = get_collision_normal()
		remainder = normal.slide(remainder)
		move(remainder)