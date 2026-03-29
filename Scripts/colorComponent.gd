extends Node
class_name ColorComponent

@export var spriteToModulate : Sprite2D
signal colorChanged(newColor : COLOR)

enum COLOR {
	PINK,
	GREY,
	BLUE
}

var currentColor : COLOR = COLOR.GREY


func getCurrentColor() -> COLOR:
	return currentColor
func setCurrentColor(new : COLOR) -> void:
	var prev : COLOR = currentColor
	currentColor = new
	changeSpriteColor(currentColor)
	if prev != currentColor:
		colorChanged.emit(currentColor)
		
func nextColor() -> void:
	setCurrentColor(min(2 as COLOR, ((getCurrentColor() as int) + 1) as COLOR) )
func prevColor() -> void:
	setCurrentColor(max(0 as COLOR, ((getCurrentColor() as int) - 1) as COLOR) )

func changeSpriteColor(newColor : ColorComponent.COLOR) -> void:
	match newColor:
		ColorComponent.COLOR.PINK:
			spriteToModulate.modulate = Color("bb1d5b")
		ColorComponent.COLOR.BLUE:
			spriteToModulate.modulate = Color("242490")
		ColorComponent.COLOR.GREY:
			spriteToModulate.modulate = Color("242424")

func isSameColor(otherColorComponent : ColorComponent) -> bool:
	return otherColorComponent.getCurrentColor() == self.getCurrentColor()
func isOpositeColor(otherColorComponent : ColorComponent) -> bool:
	return true if ( (	self.getCurrentColor() == COLOR.PINK and otherColorComponent.getCurrentColor() == COLOR.BLUE) or 
						self.getCurrentColor() == COLOR.BLUE and otherColorComponent.getCurrentColor() == COLOR.PINK ) else false
