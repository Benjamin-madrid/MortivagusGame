extends MarginContainer

@onready var resume: Button = %Resume
@onready var restart: Button = %Restart
@onready var main_menu: Button = %Main_Menu
@onready var exit: Button = %Exit


func _ready() -> void:
	hide()
	restart.pressed.connect(_on_restart_pressed)
	main_menu.pressed.connect(_on_main_menu_pressed)
	resume.pressed.connect(_on_resume_pressed)
	exit.pressed.connect(func(): get_tree().quit())

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("pause"):
		get_tree().paused = not get_tree().paused
		visible = get_tree().paused

func _on_resume_pressed() -> void:
	get_tree().paused = false
	hide()
	
func _on_restart_pressed() -> void:
	get_tree().paused = false
	get_tree().reload_current_scene()
	
func _on_main_menu_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://ui/main_menu.tscn")
	
	
