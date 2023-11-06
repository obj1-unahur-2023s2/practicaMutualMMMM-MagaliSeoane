import viajes.*

class Socio {
	const property actRealizadas= []	
	const property idiomas=[]
	const maxCantAct
	const edad
	
	method idiomaAprendido(idioma){idiomas.add(idioma)}
	method esAdoradorDeSol()= actRealizadas.all{act => act.sirveParaBroncearse()}
	method actEsforzadas()= actRealizadas.filter({act => act.implicaEsfuerzo()})
	method realizarActividad(actividad){
	if (actRealizadas.size() >= maxCantAct)
		{self.error("Ya llegó a la cantidad maxima de actividades")}
		actRealizadas.add(actividad)
	}
}

class Tranquilo inherits Socio{
	method leAtraeActividad(actividad)= actividad.cantDias() >= 4
}

class Coherente inherits Socio{
	method leAtraeActividad(actividad)= self.esAdoradorDeSol() and actividad.sirveParaBroncearse() or actividad.implicaEsfuerzo()
}

class Relajado inherits Socio{
	method leAtraeActividad(actividad)= not idiomas.intersection(actividad.idiomas()).isEmpty()
	// Considera que la interseccion del conj de idiomas del socio con el conj de idiomas de la act no sea vacia.
}