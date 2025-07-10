import wollok.game.*
import jugador.*

class Misil{
  var position
  method image() = "misil3.png"
  method position() = position
  //var id = 1.randomUpTo(100)
  method desplazarse(){
    game.onTick(130, self, {self.moverseDerecha()})
    self.misilImpacta()
  }

  method misilImpacta(){
    game.onCollideDo(self, {
      algo => algo.teChocoMisil()
      game.removeVisual(self)
      game.removeTickEvent(self)
      })
  }

  method moverseDerecha(){
    position = position.right(1)
    if (position.x() > game.width()){
      game.removeTickEvent(self)
      game.removeVisual(self)
    }
  }

  /*no hacen nada estan para que no tire error en la consola*/
}

object cantMisiles{
  method image() = "misil5.png"
  method position()= game.at(13, 13)

  const property blanco = "FFFFFFFF"

  method text()= "MISILES :" + jugador.misiles()
  method textColor()= blanco
  method textSize() = 25
}