object mariano{
	const golosinas = #{}
	
	method comprar(_golosina){
	golosinas.add(_golosina)
	}
	
	method golosinas() = golosinas

	method probarTodasLasGolosinas(){
	golosinas.forEach({golosina => golosina.probarGolosina()})
	}
	method hayGolosinasSinTACC() = golosinas.any({golosina =>
	golosina.libreGluten()})
	
	method preciosCuidados() = golosinas.all({golosina =>
	golosina.precio() < 10})
	
	method golosinaDeSabor(unSabor) = golosinas.find({golosina =>
	golosina.gusto() == unSabor})

	method golosinasDeSabor(unSabor) = golosinas.filter({golosina =>
	golosina.gusto() == unSabor})
	
	method sabores() = golosinas.map({golosina =>
	golosina.gusto()}).asSet()

	method golosinaMasCara() = golosinas.max(({golosina =>
	golosina.precio()}))

	method golosinasFaltantes(golosinasDeseadas) =
	golosinasDeseadas.difference(golosinas)
	
	method hayGolosinaDe(sabor) = golosinas.any({golosina =>
	golosina.gusto() == sabor})
	
	method gustosFaltantes(gustosDeseados) = gustosDeseados.filter
	({gusto => self.hayGolosinaDe(gusto)})
}

object bombon{
	var property precio = 5
	var property sabor = "frutilla"
	var property peso = 15
	var property tieneGluten = true
	
	method mordisco(){
		peso -= (peso * 0.2 + 1)
	}
}

object alfajor{
	var property precio = 12
	var property sabor = "chocolate"
	var property peso = 300
	var property tieneGluten = false
	
	method mordisco(){
		peso -= (peso * 0.2)
	}
}

object caramelo{
	var property precio = 1
	var property sabor = "frutilla"
	var property peso = 15
	var property tieneGluten = true
	
	method mordisco(){
		peso -= 1
	}
}

object chupetin{
	var property precio = 2
	var property sabor = "naranja"
	var property peso = 7
	var property tieneGluten = true
	
	method mordisco(){
		if (peso > 2) (peso -= (peso * 0.1))
	}
}

object oblea{
	var property precio = 5
	var property sabor = "vainilla"
	var property peso = 250
	var property tieneGluten = false
	
	method mordisco(){
		if (peso > 70) (peso -= (peso * 0.5))
			else (peso -= (peso * 0.25))
	}
}

object chocolatin{
	var property precio
	var property sabor = "chocolate"
	var property peso
	var property tieneGluten = false
	
	method asignarPeso(_peso){
		peso = _peso
		precio = 0.5 * peso
	}
	
	method mordisco(){
		peso -= 2
	}
}

object golosinaBanada{
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

object pastillaTutti_Frutti{
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

