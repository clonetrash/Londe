extends Control

export(int) var HP  #Hit points
export(int) var strength #melee attack power
export(int) var defense #against all attack types
export(int) var speed #dodge chance && fight start position
export(int) var special #special attacks (cost points)

var _HP #active/changing amount of hp
var _Special #active/changing amount of specialpoints    

export(String, "Ranged", "Melee", "Special") var AttackType
export(String, MULTILINE) var UnitName = ''
export(Texture) var UnitImage


func _ready():
	