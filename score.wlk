import jugador.*
class Numero{
     
    var property position = game.at(0, 0)
    var numero = 0
    var image = "0.png"

    method cambiarNumero(unNumero){
        numero = unNumero
    }    

    method image() = ""+ numero + ".png"

    method numero(){
        return numero
    }

    method reubicar(posX,posY){
        position = game.at(posX,posY)
    }
}

object puntos{      
    const property puntuacion = [new Numero(),new Numero(),new Numero(),new Numero()]
    var numero = 0

    method addVisual(){
     puntuacion.forEach({v => game.addVisual(v)})
    }

    method numero(){
        return numero
    }

    method removeVisual(){
    puntuacion.forEach({v => game.removeVisual(v)})
    }


    method ubicar(){
        puntuacion.get(0).reubicar(3,14)
        puntuacion.get(1).reubicar(4,14)
        puntuacion.get(2).reubicar(5,14)
        puntuacion.get(3).reubicar(6,14)
    }

    method reubicar(){
        self.addVisual()
        puntuacion.get(0).reubicar(25,24)
        puntuacion.get(1).reubicar(23,24)
        puntuacion.get(2).reubicar(21,24)
        puntuacion.get(3).reubicar(19,24)
        puntuacion.get(4).reubicar(17,24)
    }

   
    
    method sumarPuntaje(unNumero){
        numero = unNumero        
        self.cambiarPuntaje()           
    }

    method cambiarPuntaje(){
        puntuacion.get(3).cambiarNumero(numero % 10)
        puntuacion.get(2).cambiarNumero(((numero/10).truncate(0))%10)
        puntuacion.get(1).cambiarNumero(((numero/100).truncate(0)%10))
        puntuacion.get(0).cambiarNumero(((numero/1000).truncate(0)%10))
    }
   
}