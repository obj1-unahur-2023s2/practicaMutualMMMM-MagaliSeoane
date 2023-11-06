class Viaje{
	const idiomas=[]
	
	method idiomas()= idiomas
	method agregarIdioma(idioma){idiomas.add(idioma)}
	method implicaEsfuerzo()
	method sirveParaBroncearse()= true
	method cantDias()
	method esInteresante()= idiomas.size() > 1
	method esRecomendable(socio)= self.esInteresante() and socio.leAtraeActividad(self) and not socio.actRealizadas().contains(self)
	
}

class Playa inherits Viaje{
	const largo
	override method implicaEsfuerzo()= largo > 1200
	override method cantDias()= largo/500
}

class ExcursionCiudad inherits Viaje{
	const cantAtracciones
	override method implicaEsfuerzo()=  cantAtracciones.between(5,8)
	override method cantDias()= cantAtracciones / 2
	override method sirveParaBroncearse()= false
	override method esInteresante()= super() or cantAtracciones == 5
}

class ExcursionCuidadTropical inherits ExcursionCiudad{
	override method cantDias()= super() + 1
	override method sirveParaBroncearse()= true
}

class Trekking inherits Viaje{
	const km
	const diasDeSol
	override method implicaEsfuerzo()= km > 80
	override method cantDias()= km/50
	override method sirveParaBroncearse()= diasDeSol > 200 or diasDeSol.between(100,200) and km > 120
	override method esInteresante()= super() and diasDeSol > 140
}

class ClasesDeGym {
	 method idiomas() = #{"español"}
	 method implicaEsfuerzo()= true
	 method cantDias()= 1
	 method sirveParaBroncearse()= false 
	 method esRecomendable(socio)= socio.edad().between(20,30)
}

