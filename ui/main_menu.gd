extends MarginContainer

@onready var start: Button = %Start
@onready var credits: Button = %Credits
@onready var exit: Button = %Exit


func _ready() -> void:
	start.pressed.connect(func(): get_tree().change_scene_to_file("res://scenes/plataformer.tscn"))
	exit.pressed.connect(func(): get_tree().quit())
	credits.pressed.connect(func(): get_tree().change_scene_to_file("res://ui/credits.tscn"))
	
