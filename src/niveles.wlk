import pepita.*
import comidas.*
import extras.*
import wollok.game.*

object tutorial1 {

	method iniciar() {
		game.addVisual(nido)
		game.addVisual(silvestre)
		game.addVisual(pepita)
		config.configurarTeclas()
	}

}

object tutorial2 {

	method iniciar() {
		game.addVisual(manzana)
		game.addVisual(alpiste)
		game.addVisual(nido)
		game.addVisual(silvestre)
		game.addVisual(pepita)
		config.configurarTeclas()
		pepita.bajar()
	}

}

object tutorial3 {

	method iniciar() {
		game.addVisual(manzana)
		game.addVisual(alpiste)
		game.addVisual(nido)
		game.addVisual(silvestre)
		game.addVisual(pepita)
		config.configurarTeclas()
		config.configurarColisiones()
		pepita.bajar()
		pepita.pepitaHaGanado()
	}

}

object config {

	method configurarTeclas() {
		keyboard.left().onPressDo({ 
			pepita.irA(pepita.position().left(0.5))
			pepita.moveteAIzquierda()
		})
		keyboard.right().onPressDo({ 
			pepita.irA(pepita.position().right(0.5))
			pepita.moveteADerecha()
		})
		keyboard.up().onPressDo({
			pepita.irA(pepita.position().up(0.5))
			pepita.moveteAbajo()
		})
		keyboard.down().onPressDo({
			pepita.irA(pepita.position().down(0.5))
			pepita.moveteArriba()
		})
		keyboard.c().onPressDo({
			pepita.come(game.uniqueCollider(pepita))
		})
		
	}

	method cambiarSeguidor() {
		const seguidorActual = pepita.seguidor()
		const seguidorSiguiente = seguidorActual.siguiente()
		seguidorSiguiente.position(seguidorActual.position())
		game.removeVisual(seguidorActual)
		game.addVisual(seguidorSiguiente)
		pepita.seguidor(seguidorSiguiente)
	}
	method configurarColisiones() {
		game.onCollideDo(pepita, { algo => algo.teEncontro(pepita)})
	}

}