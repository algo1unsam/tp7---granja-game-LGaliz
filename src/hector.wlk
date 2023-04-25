import wollok.game.*
import cultivos.*

object hector {

	var property position = new Position(x = 3, y = 3)
	const property image = "player.png"
	const property cultivos = []
	var property oro = 0

	method validacion() = game.colliders(self).isEmpty()

	method sembrarMaiz() {
		if(self.validacion()){
			game.addVisual(new Maiz(position = position))
		}
	}

	method sembrarTrigo() {
		if(self.validacion()){	
			game.addVisual(new Trigo(position = position))
		}
	}

	method sembrarTomaco() {
		if(self.validacion()){
			game.addVisual(new Tomaco(position = position))
		}
	}

	method regar() {
		if (game.colliders(self).isEmpty()) {
			game.say(self, "No hay que regar iluso")
		} else game.uniqueCollider(self).regada()
	}

	method regada() {
		game.say(self, "Cuidado con el agua!")
	}

	method cosechar() {
		const cultivo = (game.uniqueCollider(self))
		if (game.colliders(self).isEmpty()) {
			game.say(self, "No hay que cosechar iluso")
		} else if (cultivo.estaListo()) {
			game.removeVisual(game.uniqueCollider(self))
			cultivos.add(cultivo)
		}
	}

	method vender() {
		oro += cultivos.sum({ cultivo => cultivo.precio() })
		cultivos.clear()
	}

	method informe() {
		game.say(self, "Tengo " + oro + " morlacos, y " + cultivos.size() + " plantas para vender")
	}

}

class Regador {

	const property position = game.center()
	const property image = "aspersor.png"

	method regada() {
	// No pasa na'
	}

	method regarCultivosAlrededor() {
		self.cultivosAlrededor().forEach({ cultivo => cultivo.regada()})
	}

	method cultivosAlrededor() = self.posicionesAlrededor().flatMap({ posicion => posicion.allElements() })

	method laterales() = [ position.up(1), position.left(1), position.down(1), position.right(1) ]

	method esquinas() = [ position.up(1).left(1), position.up(1).right(1), position.down(1).left(1), position.down(1).right(1) ]

	method posicionesAlrededor() = self.laterales() + self.esquinas()

}

