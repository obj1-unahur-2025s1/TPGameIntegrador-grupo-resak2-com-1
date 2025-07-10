import wollok.game.*
import jugador.*
import score.*


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
  method position()= game.at(1, 13)
}

object cantMisilesNumero{
    const property puntuacion = [new Numero(),new Numero()]
    var numero = 0

    method addVisual(){
     puntuacion.forEach({v => game.addVisual(v)})
    }

    method numero(){
        return numero
    }

    method sumarMisiles(unNumero){
        numero = unNumero
        self.cambiarPuntaje()
    }

    method ubicar(){
        puntuacion.get(0).reubicar(3,13)
        puntuacion.get(1).reubicar(4,13)
    }

     method cambiarPuntaje(){
        puntuacion.get(1).cambiarNumero(numero % 10)
        puntuacion.get(0).cambiarNumero(((numero/10).truncate(0))%10)
    }
}
