import extras.*
import wollok.game.*

object pepita {

	var property energia = 100
	var property position = game.at(0, 2)

	method image() {
		return if (self.estaEnElNido()) "pepita-grande.png" else "pepita.png"
	}

	method come(comida) {
		energia = energia + comida.energiaQueOtorga()
	}

	method vola(kms) {
		energia = energia - kms * 9
	}

	method irA(nuevaPosicion) {
		self.vola(position.distance(nuevaPosicion))
		position = nuevaPosicion
	}

	method estaCansada() {
		return energia <= 0
	}

	method estaEnElNido() {
		return self.position() == nido.position()
	}

	method moveteADerecha() {
		if(position.x() >= game.width() - 1) {
			position = game.at(0, position.y())
		} else {
			position = game.at(position.x() + 1, position.y())
		}
	}

	method moveteAIzquierda() {
		if(position.x() == -1 ) {
			position = game.at(game.width() - 1, position.y())
		} else {
			position = game.at(position.x() - 1, position.y())
		}
	}
}

