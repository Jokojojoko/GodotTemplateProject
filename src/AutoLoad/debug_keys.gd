extends Node
signal toggle_FPS
signal toggle_tools
signal toggle_monitor
func _input(event):
	if event.is_action_pressed("debug_exit"):
		get_tree().quit()
	if event.is_action_pressed("debug_fullscreen"):
		OS.window_fullscreen = !OS.window_fullscreen
	if event.is_action_pressed("debug_on_top"):
		OS.set_window_always_on_top(!OS.is_window_always_on_top())
	if event.is_action_pressed("debug_resizable"):
		OS.window_resizable=!OS.window_resizable
	if event.is_action_pressed("debug_FPS"):
		emit_signal("toggle_FPS")
	if event.is_action_pressed("debug_tools"):
		emit_signal("toggle_tools")
	if event.is_action_pressed("debug_monitor"):
		emit_signal("toggle_monitor")
