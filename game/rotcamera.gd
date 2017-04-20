extends Sprite3D

onready var player_kinem = get_node("../")
var oldpos = Vector3() 

func _ready():
	set_process(true)
	pass

func _process(delta):
	var cam_y = player_kinem.cam.get_rotation().y  
	set_rotation (Vector3 (0, (-cam_y), 0))
	
	var difference = get_global_transform().origin - oldpos
	oldpos = get_global_transform().origin
	if difference.x > 0:
		set_flip_h(false)
	if difference.x < 0:
		set_flip_h(true)