extends Control
export (String, FILE, "*tscn") var Quick_Debug

var debug_output=[	"test_int",
					"test_str",
					"test_float",
					"test_bool"]

var debug_input={	"test_int":"int",
					"test_str":"str",
					"test_float":"float",
					"test_bool":"bool"}

var test_int = 150
var test_str = "text"
var test_float = 0.1
var test_bool = false

func _ready():
	if Quick_Debug!="":
		get_tree().change_scene(Quick_Debug)
	else:
		print("Loading Main Menu")

