object mariano{
	const golosinas = #{}
	
	method golosinas() = golosinas
	
	method comprar(_golosina){
	golosinas.add(_golosina)
	}
	
	method desechar(_golosina){
	golosinas.remove(_golosina)
	}
	
	method probarTodasLasGolosinas(){
	golosinas.forEach({golosina => golosina.mordisco()})
	}
			
	method hayGolosinasSinTACC(){
	return golosinas.any({golosina =>	self.libreGluten(golosina)})
	}
	
	method libreGluten(_golosina){
	return !(_golosina.tieneGluten())
	}
	
	method preciosCuidados(){
	return golosinas.all({golosina =>	golosina.precio() < 10})
	}
	
	method golosinaDeSabor(unSabor){
	return golosinas.find({golosina =>	golosina.sabor() == unSabor})
	}

	method golosinasDeSabor(unSabor){
	golosinas.filter({golosina =>	golosina.sabor() == unSabor})
	}
	
	method sabores(){
	return golosinas.map({golosina =>	golosina.sabor()}).asSet()
	}

	method golosinaMasCara(){
	return golosinas.max(({golosina =>	golosina.precio()}))
	}

	method golosinasFaltantes(golosinasDeseadas){
	return golosinasDeseadas.difference(golosinas)
	}
	
	method hayGolosinaDe(sabor){
	golosinas.any({golosina =>	golosina.sabor() == sabor})
	}
	
	method gustosFaltantes(gustosDeseados){
	return gustosDeseados.filter({gusto => self.hayGolosinaDe(gusto)})
	}
}

class Bombon{
	var property precio = 5
	var property sabor = "frutilla"
	var property peso = 15
	var property tieneGluten = true
	
	method mordisco(){
		peso -= (peso * 0.2 + 1)
	}	
}

class Alfajor{
	var property precio = 12
	var property sabor = "chocolate"
	var property peso = 300
	var property tieneGluten = false
	
	method mordisco(){
		peso -= (peso * 0.2)
	}
}

class Caramelo{
	var property precio = 1
	var property sabor = "frutilla"
	var property peso = 15
	var property tieneGluten = true
	
	method mordisco(){
		peso -= 1
	}
}

class Chupetin{
	var property precio = 2
	var property sabor = "naranja"
	var property peso = 7
	var property tieneGluten = true
	
	method mordisco(){
		if (peso > 2) (peso -= (peso * 0.1))
	}
}

class Oblea{
	var property precio = 5
	var property sabor = "vainilla"
	var property peso = 250
	var property tieneGluten = false
	
	method mordisco(){
		if (peso > 70) (peso -= (peso * 0.5))
			else (peso -= (peso * 0.25))
	}
}

class ObleaCrujiente inherits Oblea{
	var mordiscos = 0
	
	override method mordisco(){
		super()
		if (mordiscos < 3) peso -= 3
		mordiscos ++
	}
}

class Chocolatin{
	var property sabor = "chocolate"
	var property tieneGluten = false
	var peso
	
	method peso() = peso
	
	method precio() = 0.5 * peso
	
	method mordisco(){
		peso -= 2
	}
}

class ChocolatinVIP inherits Chocolatin{
	method humedad() = heladera.coeficienteHumedad()
	
	override method peso(){
		return super() * (1 + self.humedad())
	}
}

object heladera{
	var property coeficienteHumedad = 0.1
}

class ChocolatinPremium inherits ChocolatinVIP{
	override method humedad() = super() / 2
}

class GolosinaBanada{
	var property golosinaBase
	var property precio
	var property sabor
	var property peso
	var property tieneGluten
	var property cantMordiscos = 0
	
	method asignarGolosinaBase(_golosina){
	golosinaBase = _golosina
	peso = golosinaBase.peso() + 4
	precio = golosinaBase.precio() + 2
	sabor = golosinaBase.sabor()
	tieneGluten = golosinaBase.tieneGluten()
	}
	
	method mordisco(){
		cantMordiscos += 1
		golosinaBase.mordisco()
		if (cantMordiscos <= 2) (peso -= 2)
	}
}

class PastillaTutti_Frutti{
	var property precio
	var property sabor = "frutilla"
	var property peso = 5
	var property tieneGluten
	
	method mordisco(){
		sabor = "chocolate"
		sabor = "naranja"
		sabor = "frutilla"
	}
	
	method esLibreDeGluten(_respuesta){
		tieneGluten = _respuesta
		if (tieneGluten = true) (precio = 7)
			else precio = 10
	}
}

class BombonDuro inherits Bombon{
	override method mordisco(){
		peso = (peso * 0.9)
	}	
}

class CarameloRelleno inherits Caramelo{
	override method mordisco(){
		super()
		sabor = "chocolate"
	}
}