extends Camera

export (NodePath) var playerpath
onready var player = get_node(playerpath) 
export (Vector3) var offset
export (Vector3) var focus

func _ready():
	set_process(true)
	
	pass

func _process(delta):
	var player_pos = player.get_translation()
	set_translation(player_pos+offset)
	look_at(player_pos+focus, Vector3(0,1,0))