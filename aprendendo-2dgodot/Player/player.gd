extends CharacterBody2D 

const SPEED = 300.0 #Caminhar
const JUMP_VELOCITY = -500.0 #Velocidade ao pular, negativamente em y vai pra cima

func _physics_process(delta: float) -> void: #Loop eterno (Tick de fisica)
	# Add the gravity.
	if not is_on_floor(): #Se não estiver no chão, acontece isso abaixo
		velocity += get_gravity() * delta 

	# Handle jump.
	if Input.is_action_just_pressed("Jump") and is_on_floor(): #Se pressionar tecla, sem segurar
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("Left", "Right") #Pega o eixo das coisas, x e y(get axis)
	
	#Receber um vetor que receberá
	# 0,0 = Nenhum botão
	# -1,0 = Botão esquerda
	# 1,0 = Botão direita
	
	#Axis = Pega o conjunto de botões
	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
