import wollok.game.*

class Maiz {

	const property position
	var property esAdulto = false
	var sufijo = "baby"
	const property precio = 150

	method image() = "corn_" + sufijo + ".png"

	method regada() {
		esAdulto = true
		sufijo = "adult"
	}

	method estaListo() = self.esAdulto()

}

class Trigo {

	const property position
	var nivel = 0
//	const property precio

	method image() = "wheat_" + nivel.toString() + ".png"

	method regada() {
		// sufijo = (sufijo + 1)
		nivel = (nivel + 1) % 4
	}

	method estaListo() = nivel >= 2
	
	method precio() = (nivel.min(3) - 1) * 100

}

class Tomaco {

	var property position
	var property esAdulto = false
	var sufijo = "baby"
	const property precio = 80

	method image() = "tomaco_" + sufijo + ".png"

	method regada() {
		esAdulto = true
		sufijo = "adult"
		position = if (position.y() < 9) position.up(1) else game.at(position.x(),0)
	}

	method estaListo() = true

}

