extends Label

func _ready():
	DebugKeys.connect("toggle_FPS",self,"toggle_FPS")


func toggle_FPS():
	visible=!visible


func _process(_delta):
	if visible:
		text="FPS: %-5d"%Performance.get_monitor(Performance.TIME_FPS)
		text+="   SMemory: %-10d"%Performance.get_monitor(Performance.MEMORY_STATIC)
		text+="   DMemory: %-10d"%Performance.get_monitor(Performance.MEMORY_DYNAMIC)

