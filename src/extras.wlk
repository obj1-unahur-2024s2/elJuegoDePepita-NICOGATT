import pepita.*
import wollok.game.*
import comidas.*

object nido {
	method image() = "nido.png"
	method position() = game.at(game.width() - 2, game.height() - 4)
}

object silvestre {
	var property position = game.at(3, 0)

	method image() = "silvestre.png"

	method teEncontro() {
		pepita.haPerdido()
	}
 
}

