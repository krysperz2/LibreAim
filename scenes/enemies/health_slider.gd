extends MeshInstance3D
## Slider that shows the health of the enemy targets

var enabled: bool = true

func enable():
	visible = true
	enabled = true
	position.y = ($"../CollisionShape3D/MeshInstance3D".mesh.height / 2) + 0.4

func _process(delta: float) -> void:
	if enabled:
		var health = $"..".health
		var max_health = $"..".max_health
		mesh.size.x = lerp(0, 3, health / max_health)