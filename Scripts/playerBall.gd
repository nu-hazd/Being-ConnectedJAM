extends RigidBody2D
class_name PlayerBall

@onready var color_component: ColorComponent = $ColorComponent
@onready var sprite_2d: Sprite2D = $Sprite2D
@export var startColor : ColorComponent.COLOR = ColorComponent.COLOR.GREY

func _ready() -> void:
	color_component.setCurrentColor(startColor)

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("colorLeft"):
		color_component.prevColor()
	elif Input.is_action_just_pressed("colorRight"):
		color_component.nextColor()

func colorChanged(_newColor : ColorComponent.COLOR) -> void:
	print(_newColor)
func getColorComponent() -> ColorComponent:
	return color_component
