extends Sprite3D

onready var player_kinem = get_node("../")


func _ready():
	set_process(true)
	pass

func _process(delta):
	var cam_y = player_kinem.cam.get_rotation().y  
	set_rotation (Vector3 (0, (-cam_y+PI), 0))