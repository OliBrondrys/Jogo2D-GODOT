extends CharacterBody2D
const SPEED = 200.0

func _physics_process(delta: float) -> void:
	var direction := Vector2 (
					Input.get_axis("left", "right"),
					Input.get_axis("up", "down")
					).normalized()
	if direction:
		velocity = direction * SPEED
	else:
		velocity = Vector2.ZERO
		AnimatedSprite2D

	move_and_slide()
