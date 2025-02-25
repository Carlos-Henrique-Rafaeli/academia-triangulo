extends Control


@onready var triangulolabel = $TrianguloLabel
@onready var triangulotexture = $TrianguloTexture


var index_x : int
var index_y : int
var index_z : int


func _calcular_triangulo(x, y, z):
	if x == 0 or y == 0 or z == 0:
		triangulolabel.text = "O triângulo é: Inválido"
		triangulotexture.texture = null
		return
	
	
	if x + y > z and x + z > y and z + y > x:
		
		if x == y and y == z:
			triangulolabel.text = "O triângulo é: Equilátero"
			triangulotexture.texture = load("res://Texturas/equilatero.png")
			print("Equilátero")
		
		elif x == y or x == z or y == z:
			triangulolabel.text = "O triângulo é: Isóceles"
			triangulotexture.texture = load("res://Texturas/isoceles.png")
			print("Isóceles")
		
		else:
			triangulolabel.text = "O triângulo é: Escaleno"
			triangulotexture.texture = load("res://Texturas/escaleno.png")
			print("Escaleno")
	
	else:
		triangulolabel.text = "O triângulo é: Inválido"
		triangulotexture.texture = null
		printerr("Invalido")


func _on_index_x_text_changed(text: String) -> void:
	var new_text = text.strip_edges()
	
	if new_text.begins_with("-"):
		printerr("Começa com -")
		index_x = 0
		return
	
	var new_number = int(new_text)
	
	if str(new_number) == new_text:
		index_x = new_number
		print(new_number)
	else:
		index_x = 0
		printerr("Tem caracteres")


func _on_index_y_text_changed(text: String) -> void:
	var new_text = text.strip_edges()
	
	if new_text.begins_with("-"):
		printerr("Começa com -")
		index_y = 0
		return
	
	var new_number = int(new_text)
	if str(new_number) == new_text:
		index_y = new_number
		print(new_number)
	else:
		index_y = 0
		printerr("Tem caracteres")


func _on_index_z_text_changed(text: String) -> void:
	var new_text = text.strip_edges()
	
	if new_text.begins_with("-"):
		printerr("Começa com -")
		index_z = 0
		return
	
	var new_number = int(new_text)
	if str(new_number) == new_text:
		index_z = new_number
		print(new_number)
	else:
		index_z = 0
		printerr("Tem caracteres")


func _on_calcular_button_pressed() -> void:
	_calcular_triangulo(index_x, index_y, index_z)


func _on_quit_button_pressed() -> void:
	get_tree().quit()
