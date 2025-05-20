import wollok.game.*
import hector.*
import cultivos.*

object config {

	method iniciar() {
		self.configurarTeclas()
		game.addVisualCharacter(hector)
		const regador = new Regador()
		game.addVisual(regador)
		game.onTick(1000, "REGADOR", { regador.regarCultivosAlrededor()})
	// game.addVisualIn(new Regador(position =  game.center()), game.center())
	// game.addVisualIn(new Maiz(), game.at(1, 1))
	}

	method configurarTeclas() {
	//	keyboard.f().onPressDo{ hector.sembrar(new Maiz(position = hector.position()))} // USAR ESTA OPCION
		keyboard.m().onPressDo{ hector.sembrarMaiz()}
		keyboard.t().onPressDo{ hector.sembrarTrigo()}
		keyboard.o().onPressDo{ hector.sembrarTomaco()}
		keyboard.c().onPressDo{ hector.cosechar()}
		keyboard.r().onPressDo{ hector.regar()}
		keyboard.v().onPressDo{ hector.vender()}
		keyboard.space().onPressDo{hector.informe()}
	}

}

