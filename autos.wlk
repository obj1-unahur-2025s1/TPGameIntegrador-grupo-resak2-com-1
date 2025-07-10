import juego.*
import jugador.*
import wollok.game.*




class Auto{

    //const velocidad = 150
    var property position 
    var property image 
    var durabilidad = 1.max(0)

    const id = 1.randomUpTo(100) /*se puede usar un self, creo que no se lague tanto tambien*/
    
    method velocidad() = 150

    method desplazarse() {
        game.onTick(self.velocidad(), id ,{self.moverseIzquierda()})
    }
    method moverseIzquierda(){
        position = position.left(1)
        if (position.x() < 0){
            game.removeVisual(self)
            game.removeTickEvent(id)
        }
    }

    method generarAuto(){
        game.addVisual(self)
        
    }

method teChocoMisil(){   
   const explosion = game.sound("explosion69.mp3")
   explosion.play()
   explosion.volume(0.2)
   durabilidad = durabilidad - 1
   if (durabilidad == 0){
     game.removeVisual(self)
     game.removeTickEvent(id)
     jugador.sumarPuntos(100)
   }


    }
    
     method chocarAuto(){
        jugador.teChocoAuto()
        game.removeTickEvent(id)
        game.removeVisual(self) /*elimina los autos que impacten contra el personaje*/
    }

    method aumentarDurabilidad(cantidad) {durabilidad = durabilidad + cantidad}

}

///////////////////////////

object explosion{
  const boom = "explosion2.mp3"

  method reproducir(){
    boom.play()
  }
}

////////////////////////////


class Auto2 inherits Auto {
    method initialize(){
        self.aumentarDurabilidad(1)
    } 
    override method velocidad() = 100
}



object trafico {
    method generarAutos(){
    //const listaCarril= [3, 5, 7, 9]
    //const listaPosicion= [10,12, 14, 16]
    const a1 = new Auto(position=game.at(14.randomUpTo(24), 5), image = "autoRojo.png")
    const a2 = new Auto(position=game.at(14.randomUpTo(24), 9), image = "auto2.png" )
    const a3 = new Auto(position=game.at(14.randomUpTo(24), 7), image = "auto2.png")
    const a4 = new Auto(position=game.at(14.randomUpTo(24), 3), image = "auto7.png")
    //const lista = [a1,a2,a3,a4]

    //lista.forEach({auto => game.addVisual(auto)})

    game.schedule(500, {game.addVisual(a1)}) 
    game.schedule(900, {game.addVisual(a2)}) 
    game.schedule(1300, {game.addVisual(a3)}) 
    game.schedule(1700, {game.addVisual(a4)}) 

    game.schedule(500, {a1.desplazarse()}) 
    game.schedule(1500, {a2.desplazarse()}) 
    game.schedule(1600, {a3.desplazarse()}) 
    game.schedule(1000, {a4.desplazarse()}) 
    }
}

object traficoDuro {
      method generarAutos(){
    const a1 = new Auto2(position=game.at(8.randomUpTo(14), 5), image = "autoRojo.png")
    const a2 = new Auto2(position=game.at(12.randomUpTo(14), 9), image = "auto2.png" )
    const a3 = new Auto2(position=game.at(8.randomUpTo(14), 7), image = "auto2.png")
    const a4 = new Auto2(position=game.at(9.randomUpTo(14), 3), image = "auto7.png")
    //const lista = [a1,a2,a3,a4]

    //lista.forEach({auto => game.addVisual(auto)})

    game.schedule(500, {game.addVisual(a1)}) 
    game.schedule(1700, {game.addVisual(a2)}) 
    game.schedule(1300, {game.addVisual(a3)}) 
    game.schedule(800, {game.addVisual(a4)}) 

    game.schedule(500, {a1.desplazarse()}) 
    game.schedule(1500, {a2.desplazarse()}) 
    game.schedule(1600, {a3.desplazarse()}) 
    game.schedule(1000, {a4.desplazarse()}) 
    }
} 