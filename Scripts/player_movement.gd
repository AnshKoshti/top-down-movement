extends CharacterBody2D

@export var movement_speed : float = 500
var character_direction : Vector2

func _physics_process(_delta: float) -> void:
	character_direction.x = Input.get_axis("Left", "Right")
	character_direction.y = Input.get_axis("Up", "Down")
	character_direction = character_direction.normalized()
	
	# Filp character according to direction.
	if character_direction.x > 0: %sprite.flip_h = false
	elif character_direction.x < 0: %sprite.flip_h = true
	
	if character_direction:
		velocity = character_direction * movement_speed
		if %sprite.animation != "walk": %sprite.animation = "walk"
	else:
		velocity = velocity.move_toward(Vector2.ZERO, movement_speed)
		if %sprite.animation != "idle": %sprite.animation = "idle"
	
	move_and_slide()
