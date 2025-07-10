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

  const vida3 = new Vida(position=game.at(13, 14))
  const vida2 = new Vida(position=game.at(12, 14))
  const vida1 = new Vida(position=game.at(11, 14))

  const vidas = []
  
  method añadirVidas(){
    vidas.addAll([vida1,vida2,vida3])
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

      final.iniciar()
      //game.clear()
      //game.addVisual(final)
      //nivel.detenerSonido()
      /*final.iniciar()
      game.addVisual(gameOver)*/
    }
  }

}


