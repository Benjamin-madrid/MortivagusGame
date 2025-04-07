extends CharacterBody2D

var SPEED = 175
var ACC = 1500
var JUMP_SPEED = -300

@onready var hurtbox: Hurtbox = $Pivot/Hurtbox
@onready var hitbox: Hitbox = $Pivot/Hitbox
@onready var animation_tree: AnimationTree = $AnimationTree
@onready var playback = animation_tree.get("parameters/playback")
@onready var pivot: Node2D = $Pivot
@onready var death_screen: MarginContainer = $CanvasLayer2/DeathScreen
@onready var jump_sound: AudioStreamPlayer = $JumpSound
@onready var scream_sound: AudioStreamPlayer = $ScreamSound
@onready var dying_sound: AudioStreamPlayer = $DyingSound

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_SPEED
		jump_sound.play()
		
	var move_direction = Input.get_axis("move_left", "move_right")
	velocity.x = move_toward(velocity.x, SPEED * move_direction, ACC * delta)
	
	move_and_slide()
	
	# animation
	if move_direction != 0:
		pivot.scale.x = -sign(move_direction)
	if is_on_floor():
		if abs(velocity.x) > 10:
			playback.travel("walk")
		else:
			playback.travel("idle")
	else:
		if velocity.y < 0:
			playback.travel("jump")
		else:
			playback.travel("land")


func _on_hitbox_hit() -> void:
	dying_sound.play()
	enemy_hit()
	
func enemy_hit() -> void:
	velocity.y = -150
	
func _on_hurtbox_hurtbox_hit() -> void:
	scream_sound.play(0.2)
	get_tree().paused = true
	death_screen.visible = true
	
	
