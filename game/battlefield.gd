extends Control

func _ready():
	get_node("AttackPlayer").connect("pressed",get_node("Enemy"),'attack',[get_node("Enemy")])
	get_node("AttackEnemy").connect("pressed",get_node("Player"),'attack',[get_node("Player")])
	pass
