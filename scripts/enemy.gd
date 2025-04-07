class_name Enemy
extends CharacterBody2D

var SPEED = 25
var player = null
var MOVE_RANGE = 200

@onready var hurtbox: Hurtbox = $Pivot/Hurtbox
@onready var animation_tree: AnimationTree = $AnimationTree
@onready var playback = animation_tree.get("parameters/playback")
@onready var pivot: Node2D = $Pivot


func _ready() -> void:
	player = get_parent().get_node("Player")

	
func _process(_delta):
	var distance = global_position.distance_to(player.global_position)
	
	if distance < MOVE_RANGE:
		var direction = (player.global_position - global_position).normalized()
		velocity.x = direction.x * SPEED
	else:
		velocity.x = 0 
		
	move_and_slide()
	
	if velocity.x != 0:
		pivot.scale.x = -sign(velocity.x)
		
	if abs(velocity.x) > 0:
		playback.travel("walk")
	else:
		playback.travel("idle")

func _on_hurtbox_hurtbox_hit() -> void:
	queue_free()
