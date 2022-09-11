extends Control

var Velocity : Vector2 

var lastposition : Vector2

var polygon : PackedVector2Array

@export var Triangle : Polygon2D

var boundary : Vector2i

func _ready():
	print("Hello World") 
	print(Triangle.name)
	Velocity.x = 125
	Velocity.y = 100
	lastposition = Triangle.global_position
	get_tree().get_root() # access via scenemainloop
	print(get_tree().get_root().size)
	boundary.x = 1152 #1152 base
	boundary.y = 648 #648 base
	print(Triangle.polygon)
	
	#var index : int = 0
	var index := 0 #shorthand for above. This assigns type and value in same line.
	
	while index < Triangle.polygon.size():
		print(Triangle.polygon[index])
#		index = index + 1
		index += 1 #shorthand for above
	
	
	

func _process(delta : float):
	print(Triangle.name)
	print(Triangle.global_position)
	
	var Pivot := Triangle.global_position
	
	var index := 0
	
	while index < Triangle.polygon.size():
		
		print(Triangle.polygon[index])
		
		var point = Triangle.polygon[index] + Pivot
		
		if point.x >= boundary.x:
			Velocity.x = 0
		
		if point.y >= boundary.y:
			Velocity.y = 0
			
		index += 1
	

	
	
#	Triangle.global_position = Vector2(0,0) 
#	Triangle.global_position = Triangle.global_position + Velocity  reg=reg*reg aids


#	Triangle.global_position = lastposition + Velocity
#	lastposition = Triangle.global_position

	Triangle.global_position += Velocity * delta #short hand
