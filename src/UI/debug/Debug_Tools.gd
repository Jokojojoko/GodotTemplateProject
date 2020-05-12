extends Control

export var inputs :Array

onready var base = $Debug_Panel/ScrollContainer/VBoxContainer
var types = {}

func _ready():
	DebugKeys.connect("toggle_tools",self,"toggle_tools")


func toggle_tools():
	self.visible=!self.visible
	create_forms()


func create_forms():
	for child in base.get_children():
		base.remove_child(child)
		child.queue_free()
	for node in inputs:
		for key in get_node(node).debug_input:
			var edit = LineEdit.new()
			edit.add_font_override("font",load("res://assets/UI/Fonts/Debug_Label_font.tres"))
			edit.expand_to_text_length=true
			edit.text=str(get_node(node).get(key))
			if get_node(node).debug_input[key]=="bool":
				edit.text=str(int(get_node(node).get(key)))
			var label = RichTextLabel.new()
			label.bbcode_enabled=true
			label.bbcode_text="%s [color=gray](%s/)[/color]"%[key,node]
			label.rect_min_size=Vector2(10000,40)
			label.add_font_override("normal_font",load("res://assets/UI/Fonts/Debug_Label_font.tres"))
			label.anchor_left=1
			label.margin_left=15
			edit.add_child(label)
			types[edit]=[node,key]
			base.add_child(edit)


func _on_Set_All_Button_pressed():
	for edit in base.get_children():
		var data
		match get_node(types[edit][0]).debug_input[types[edit][1]]:
			"int":
				data=int(edit.text)
			"float":
				data=float(edit.text)
			"str":
				data=str(edit.text)
			"bool":
				data=bool(int(edit.text))
		get_node(types[edit][0]).set(types[edit][1],data)
