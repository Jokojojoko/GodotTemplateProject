extends RichTextLabel

export var outputs :Array


func _ready():
	DebugKeys.connect("toggle_monitor",self,"toggle_monitor")

func toggle_monitor():
	visible=!visible

func _process(_delta):
	if self.visible:
		bbcode_text=""
		for node in outputs:
			for variable in get_node(node).debug_output:
				bbcode_text+="[color=gray]%s/[/color][color=silver]%s:[/color] %s\n"%[node,variable,get_node(node).get(variable)]
