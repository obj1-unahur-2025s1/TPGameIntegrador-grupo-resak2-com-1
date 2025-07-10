import jugador.*
import autos.*
import vidas.*
import misiles.*
import wollok.game.*
import score.*

object ultimoNivelJugado {
  var property nivelJugado = null
}

object nivel {
  const sonidoInGame = game.sound ("sonidoGame.mp3")
  method iniciar(){
   game.addVisual(fondo)
   jugador.reiniciar()
   sonidoInGame.play()
   sonidoInGame.volume(0.2)
   self.configurar()
   fondo.animacion()
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
    game.onTick(5000, "cargar misiles", {jugador.cargarMisiles()})
    game.onTick(100, "puntos", {puntos.sumarPuntaje(jugador.puntos())})
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
    game.addVisual(cantMisiles)
    vidas.añadirVidas()
    game.addVisual(puntaje)
    puntos.ubicar()
    puntos.addVisual()
    
  }

  method detenerSonido() {
    sonidoInGame.stop()
  }

}

/////////////////////////////////////////////////////////////////////////////////////////////////////////


object nivel2 {
  
  const sonidoInGame = game.sound ("sonidoGame.mp3")
  method iniciar(){
  game.addVisual(fondo)
  jugador.reiniciar()
  sonidoInGame.play()
  sonidoInGame.volume(0.5)
  self.configurar()
  fondo.animacion()
  }

  method configurar(){
    self.visuales()
    self.movimientoPersonaje()
    self.colisiones()
    self.eventos() 

  }  

  method eventos(){
    game.onTick(2500, "generarAutos", {traficoDuro.generarAutos()})
    game.onTick(1000, "Sumar puntos", {jugador.sumarPuntos(10)})
    game.onTick(5000, "cargar misiles", {jugador.cargarMisiles()})
    game.onTick(100, "puntos", {puntos.sumarPuntaje(jugador.puntos())})
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
    game.addVisual(cantMisiles)
    vidas.añadirVidas()
    game.addVisual(puntaje)
    puntos.ubicar()
    puntos.addVisual()
    
  }

  method detenerSonido() {
    sonidoInGame.stop()
  }

}

  /*game.cellSize(54) */

///////////////////////////////////////////////////////////////////////////////////////////////////////////


object menu {
  const sonido = game.sound("menu1.mp3")
  var property ultimoJugado = null

  method iniciar(){
    game.boardGround("elMejorGris.png")
    sonido.play()
    sonido.volume(0.2)
    self.aniadirEscenario()
    game.addVisual(start)

    keyboard.num1().onPressDo({
  
      sonido.stop()
      game.clear()
      ultimoJugado = nivel
      //ultimoNivelJugado.nivelJugado(nivel)
      nivel.iniciar()
      })

    keyboard.num2().onPressDo({
      sonido.stop()
      game.clear()
      ultimoJugado = nivel2
      //ultimoNivelJugado.nivelJugado(nivel2)
      nivel2.iniciar()
      
    })
    
    keyboard.num3().onPressDo({
      instrucciones.iniciar()
      game.removeVisual(start)
    })
  }

  method aniadirEscenario(){
    game.width(15)
    game.height(15)
    game.cellSize(54)
    game.addVisual(fondo)
  }

}

//////////////////

object fondo {
  var x = 0 // posición horizontal del fondo

  method image() = "fondo5.png"
  method position() = game.at(x, 0)

  method mover() {
    x = x - 1
    // cuando se va la imagen a la izquierda, la misma se repocisiona en x = 0
    if (x <= -15) {
      x = 0
    }
  }

  method animacion() {
    game.onTick(200, "scrollFondo", {self.mover()})
  }
}



//////////////////

object start {
  var property position = game.at(1,-2)
  method image() = "menu.png"
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////

object final{
  const property position = game.at(0, 0)
  const property image = "gameover3.png"
  method iniciar(){
    game.clear()
    //game.addVisual("fondo.png")
    game.addVisual(self)

    menu.ultimoJugado().detenerSonido()
    //ultimoNivelJugado.nivelJugado().detenerSonido()
    
    
    keyboard.r().onPressDo({
      game.removeVisual(self)
      game.removeVisual(fondo)
      menu.iniciar()
      })
  }
}

/////////////////

/////////////////


object puntaje {
  const property blanco = "FFFFFFFF"
  method position() = game.at(1, 14)
  method image()= "Score1.png"
  
}


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

object instrucciones {
  method iniciar(){
    game.addVisual(instruccionesPantalla)
    keyboard.q().onPressDo({
      game.removeVisual(instruccionesPantalla)
      game.addVisual(start)
      menu.iniciar()
    })
  }
}


object instruccionesPantalla {
  const property position = game.at(1,-2)
  method image() = "instrucciones.png"
}

