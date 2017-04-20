extends Control

export(int) var HP  #Hit points
export(int) var strength #melee attack power
export(int) var defense #against all attack types
export(int) var speed #dodge chance && fight start position
export(int) var expertise #special attacks (cost points)
export(int) var accuracy #ranged attack power

var _HP #active/changing amount of hp
var _Special #active/changing amount of specialpoints    

export(String, "Ranged", "Melee", "Special") var AttackType
export(String, MULTILINE) var UnitName = ''
export(Texture) var UnitImage


func attack(target):
	var attackPower
	
	if AttackType == "Ranged":
		attackPower = accuracy
	if AttackType == "Melee":
		attackPower = strength
	if AttackType == "Special":
		attackPower == expertise

	var absorbed = round(attackPower*(target.strength*0.1))
	
	var totalDamage = attackPower - absorbed
	
	var dodged = false
	
	var ch = rand_range (1,50)
	print(ch)
	if ch < target.dexterity*2:
		totalDamage = 0
		dodged = true
		
	target.takeDamage(totalDamage,dodged)


func takeDamage(amount, dodged):
	_HP = _HP-amount
	if _HP > 0 :
		get_node("hp_changing").set_text(str(_HP))
		if dodged:
			get_node("FightText").set_text("DODGED!")
		else:
			get_node("FightText").set_text("-"+str(amount)+" HP")
	else:
		die()

func die():
	print("you died")
	get_node("hp_changing").set_text("dead")
	

func _ready():
	_HP = HP
	get_node("hp_changing").set_text(str(_HP))
	get_node("UnitName").set_text(UnitName)
	get_node("Sprite").set_texture(UnitImage)