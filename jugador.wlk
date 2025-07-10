import juego.*
import autos.*
import wollok.game.*
import misiles.*
import vidas.*


object jugador {

  method reiniciar(){
    vida = 3
    image = "autoRojo2.png"
    puntos = 0
    misiles = 10
  }

  var property vida = 3
  var misiles = 10
  var puntos = 0
  
  method perderVida() {
    vida = (vida - 1).max(0)
    self.autoEstado()
    }

  method puntos() = puntos
  method misiles() = misiles

  var property position = game.at(0,3)
  var property image = "autoRojo2.png"

  method disparar(){
   if (misiles > 0){
    const misil = new Misil(position=position.right(1))
    game.addVisual(misil)
    misil.desplazarse()
    misiles = (misiles - 1).max(0)
    }
  }

  method autoEstado(){
    if (vida == 3){
      image = "autoRojo2.png"
    }
    else if (vida == 2){
      image = "autoDañado.png"
    }
    else {
      image = "autoDañado2.png"
    }
  }

  /*aca esto se podria resolver solo con un if y un else */

  method sumarPuntos(cantidad) {puntos = puntos + cantidad} 

  method cargarMisiles() {misiles = misiles + 2}
  
  method irHaciaDerecha(){
    if(position.right(1).x() <= 11){
      position = position.right(2)
    }
  }

  method irHaciaIzquierda(){
    if(position.left(1).x() >= 0){
      position = position.left(2)
    }
  }

  method irHaciaArriba(){
    if(position.up(2).y() <= 10){
      position = position.up(2)
    }
  }

  method irHaciaAbajo(){
    if(position.down(2).y() >= 3){
      position = position.down(2)
    }
  }

   method teChocoAuto(){
    vidas.removerVida()
    
  }

  method cargarVida(cantidad) {vida = vida + cantidad}



}



