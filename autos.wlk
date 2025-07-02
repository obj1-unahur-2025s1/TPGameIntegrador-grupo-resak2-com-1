import juego.*
import jugador.*
import wollok.game.*




class Auto{

    const velocidad = 150
    var property position 
    var property image 

    const id = 1.randomUpTo(100) /*se puede usar un self, creo que no se lague tanto tambien*/
    
    method desplazarse() {
        game.onTick(velocidad, id ,{self.moverseIzquierda()})
    }
    method moverseIzquierda(){
        position = position.left(1)
        if (position.x() <= 0){
            game.removeVisual(self)
            game.removeTickEvent(id)
        }
    }

    method generarAuto(){
        game.addVisual(self)
        
    }

    method teChocoMisil(){
        game.removeVisual(self)
        game.removeTickEvent(id)
        jugador.cargarMisiles(1)
        jugador.sumarPuntos(100)
    }
    
     method chocarAuto(){
        jugador.teChocoAuto()
        game.removeTickEvent(id)
        game.removeVisual(self) /*elimina los autos que impacten contra el personaje*/
    }

}






object trafico {
    method generarAutos(){
    const a1 = new Auto(position=game.at(8.randomUpTo(14), 5), image = "autoRojo.png")
    const a2 = new Auto(position=game.at(12.randomUpTo(14), 9), image = "auto2.png" )
    const a3 = new Auto(position=game.at(8.randomUpTo(14), 7), image = "auto2.png")
    const a4 = new Auto(position=game.at(9.randomUpTo(14), 3), image = "auto7.png")
    //const lista = [a1,a2,a3,a4]

    //lista.forEach({auto => game.addVisual(auto)})

    game.schedule(500, {game.addVisual(a1)}) 
    game.schedule(1500, {game.addVisual(a2)}) 
    game.schedule(1600, {game.addVisual(a3)}) 
    game.schedule(1000, {game.addVisual(a4)}) 

    game.schedule(500, {a1.desplazarse()}) 
    game.schedule(1500, {a2.desplazarse()}) 
    game.schedule(1600, {a3.desplazarse()}) 
    game.schedule(1000, {a4.desplazarse()}) 

    //lista.forEach({auto => auto.chocarAuto()})

    //lista.forEach({auto => auto.desplazarse()})
  
 
   // lista.addAll([a1, a2, a3, a4])
   // game.schedule(500, {game.addVisual(lista.get(0))}) 
   // game.schedule(1500, {game.addVisual(lista.get(1))}) 
   // game.schedule(2000, {game.addVisual(lista.get(2))}) 
   // game.schedule(1000, {game.addVisual(lista.get(3))}) 
//
   // game.schedule(500, {a1.desplazarse()}) 
   // game.schedule(1500, {a2.desplazarse()}) 
   // game.schedule(2500, {a3.desplazarse()}) 
   // game.schedule(1000, {a4.desplazarse()}) 
 // method generarAutos(){
//
 //   var a1 = new Auto2(position=game.at(8.randomUpTo(14),5))
 //   var a2 = new Auto2(position=game.at(12.randomUpTo(14),9))
 //   var a3 = new Auto(position=game.at(8.randomUpTo(14),7))
 //   var a4 = new Auto(position=game.at(9.randomUpTo(14),3))
//
 //   
//
 //   
//
 //   a1.chocarAuto()
 //   a2.chocarAuto()
 //   a3.chocarAuto()
 //   a4.chocarAuto()
    }
}

