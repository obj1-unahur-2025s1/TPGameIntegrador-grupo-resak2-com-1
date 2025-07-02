import jugador.*
import autos.*
import vidas.*
import misiles.*
import wollok.game.*




object nivel {
  const sonidoInGame = game.sound ("sonidoGame.mp3")
  method iniciar(){
  sonidoInGame.play()
  self.configurar()
  }

  method configurar(){
    self.visuales()
    self.movimientoPersonaje()
    self.colisiones()
    self.eventos()  
  }  

  method eventos(){
    game.onTick(2500, "generarAutos", {trafico.generarAutos()})
    game.onTick(1000, "Sumar puntos", {jugador.sumarPuntos(10)})
  }

   method colisiones() {
    game.onCollideDo(jugador, {otroAuto => otroAuto.chocarAuto()})
  }

  method movimientoPersonaje(){
    keyboard.right().onPressDo({jugador.irHaciaDerecha()})
    keyboard.left().onPressDo({jugador.irHaciaIzquierda()})
    keyboard.up().onPressDo({jugador.irHaciaArriba()})
    keyboard.down().onPressDo({jugador.irHaciaAbajo()})
    keyboard.space().onPressDo({jugador.disparar()})
  }


  method visuales(){
    game.addVisual(jugador)
    game.addVisual(puntaje)
    game.addVisual(cantMisiles)
    vidas.añadirVidas()
  }

  method detenerSonido() {
    sonidoInGame.stop()
  }

}

  /*game.cellSize(54) */

///////////////////////////////////////////////////////////////////////////////////////////////////////////


object menu {
  const sonido = game.sound("menu1.mp3")
  method iniciar(){
    sonido.play()
    self.aniadirEscenario()
    game.addVisual(start)
    keyboard.enter().onPressDo({
      sonido.stop()
      nivel.iniciar()
      game.removeVisual(start)
      })
  }

  method aniadirEscenario(){
    game.width(15)
    game.height(13)
    game.cellSize(54)
    game.boardGround("calle.png")
  }

}

object start {
  var property position = game.at(1,-2)
  method image() = "menu.png"
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////

object final{
  const property position = game.at(1, -2)
  const property image = "gameOver.png"
  


}

object puntaje {
  const property blanco = "FFFFFFFF"
  method position() = game.at(11, 11)
  method text() = "SCORE :" + jugador.puntos()
  method textColor() =  blanco
  method textSize() = 25
}
