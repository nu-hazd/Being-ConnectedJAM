extends Area2D
class_name LaunchPad

var player : PlayerBall
var playerDocked : bool = false
var playerLaunched : bool = false
@export var launchForce : int = 500
@onready var color_component: ColorComponent = $ColorComponent
@export var startColor : ColorComponent.COLOR = ColorComponent.COLOR.GREY
func _ready() -> void:
	color_component.setCurrentColor(startColor)
func _physics_process(_delta: float) -> void:
	if player:
		if not playerLaunched and abs(player.global_position - global_position).length() <= 25 and player.getColorComponent().isOpositeColor(color_component):
			dockPlayer()
		if playerDocked:
			if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
				player.apply_central_impulse((global_position - get_global_mouse_position()).normalized()*launchForce)
				playerDocked = false
				playerLaunched = true
func _on_body_entered(body: Node2D) -> void:
	if body is PlayerBall:
		player = body
func _on_body_exited(body: Node2D) -> void:
	if body is PlayerBall:
		playerLaunched = false
		body = null
func dockPlayer() -> void:
	player.gravity_scale = 0
	playerDocked = true
	player.global_position = self.global_position
	player.linear_velocity = Vector2.ZERO
