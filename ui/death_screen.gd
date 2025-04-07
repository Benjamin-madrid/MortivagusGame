extends MarginContainer

@onready var restart: Button = %Restart
@onready var main_menu: Button = %Main_Menu

func _ready() -> void:
	hide()
	restart.pressed.connect(_on_restart_pressed)
	main_menu.pressed.connect(_on_main_menu_pressed)
	
func _on_restart_pressed() -> void:
	get_tree().paused = false
	get_tree().reload_current_scene()
	
func _on_main_menu_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://ui/main_menu.tscn")
