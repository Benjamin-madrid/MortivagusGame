extends Control

@onready var main_menu: Button = %Main_Menu
@onready var credits: RichTextLabel = $VBoxContainer/Credits

func _ready() -> void:
	main_menu.pressed.connect(_on_main_menu_pressed)
	credits.meta_clicked.connect(_on_url_clicked)

func _on_url_clicked(meta):
	OS.shell_open(str(meta))

func _on_main_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://ui/main_menu.tscn")
