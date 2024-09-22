import extras.*
import wollok.game.*

object pepita {

	var property energia = 100
	var property position = game.at(0, 2)
	var property seguidor = silvestre 

	method image() {
		return (if (self.estaEnElNido()){
			"pepita-grande.png"
		} else if(self.estaArribaDeSilvestre() or self.estaCansada()) {
			 "pepita-gris.png"
		} else {
			"pepita.png"
		})
	}

	method come(comida) {
		energia = energia + comida.energiaQueOtorga()
		game.removeVisual(comida)
	}

	method vola(kms) {
		energia = energia - kms * 9
	}

	method irA(nuevaPosicion) {
		if (not self.estaCansada()){
			self.vola(position.distance(nuevaPosicion))
			position = nuevaPosicion
			seguidor.position(game.at(3.max(position.x()), seguidor.position().y()))
			game.say(self, "Pepita tiene una energia de: " +  self.energia())
		} else {
			game.stop()
		}
	}

	method estaCansada() {
		return energia <= 0
	}

	method estaEnElNido() {
		return self.position() == nido.position()
	}

	method moveteADerecha() {
		if(position.x() >= game.width() - 1 and (not self.estaCansada())) {
			position = game.at(0, position.y())
		} else if(not self.estaCansada()) {
			position = game.at(position.x() + 0.5, position.y())
		}
	}

	method moveteAIzquierda() {
		if(position.x() == -1  and (not self.estaCansada())) {
			position = game.at(game.width() - 1, position.y())
		} else if(not self.estaCansada()) {
			position = game.at(position.x() - 0.5, position.y())
		}
	}

	method moveteAbajo() {
		if(position.y() == game.height() - 1 and not self.estaCansada()) {
			position = game.at(position.x(), 0)
		} else if (not self.estaCansada()) {
			position = game.at(position.x(), position.y() + 0.5)
		}
	}

	method moveteArriba() {
		if (position.y() == -1 and not self.estaCansada()) {
			position = game.at(position.x(), game.height() - 1)
		} else if (not self.estaCansada()) {
			position = game.at(position.x(), position.y() - 0.5)
		}
	}

	method estaArribaDeSilvestre() {
		return self.position() == silvestre.position()
	}
	method bajar() {
		game.onTick(800, "pepitaLaLinda", {
			=> position = game.at(position.x(), 0.max(position.y() - 0.5))
		})
	}

	method pepitaHaGanado() {
		if(self.estaEnElNido()) {
			game.say(null, "Ha ganado")
		}
	}
}

