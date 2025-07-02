import wollok.game.*
import jugador.*
import juego.*

class Vida{
  const imagen = "corazon.png"
  method image() = imagen
  const position
  method position() = position
}

object vidas {

  const vida3 = new Vida(position=game.at(13, 12))
  const vida2 = new Vida(position=game.at(12, 12))
  const vida1 = new Vida(position=game.at(11, 12))

  const vidas = [vida1,vida2,vida3]
  
  method añadirVidas(){
    game.addVisual(vida1)
    game.addVisual(vida2)
    game.addVisual(vida3)
  }

  method removerVida() {
    jugador.perderVida()
    game.removeVisual(vidas.first())
    vidas.remove(vidas.first())
    self.terminarJuego()
  }

  method terminarJuego(){
    if (vidas.isEmpty()){
      game.clear()
      game.addVisual(final)
      nivel.detenerSonido()
      /*final.iniciar()
      game.addVisual(gameOver)*/
    }
  }
}
