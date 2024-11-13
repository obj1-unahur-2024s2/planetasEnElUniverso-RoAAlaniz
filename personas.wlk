import construcciones.*
import planeta.*
class Persona {
    var monedas = 20 
    var edad 

    method edad() = edad
    method cumplirAnios() {
        edad = edad + 1
    }
    method recursosMonedas() = monedas
    method ganarMonedas(unaCant) {
        monedas = monedas + unaCant
    } 
    method gastarMonedas(unaCant) {
        monedas = (monedas - unaCant).max(0) 
    }
    method esDestacada() = edad.between(18, 65) or monedas > 30
}

class Productor inherits Persona {
    const tecnicas = ["cultivo"]
    
    override method recursosMonedas() {
        return super() * tecnicas.size()
    }
    override method esDestacada(){
        return super() and tecnicas.size() > 5
    }
    method realizarTecnica(tiempo, tecnica) {
        if (tecnicas.contains(tecnica))
        {self.ganarMonedas(3 * tiempo)}
        else{self.gastarMonedas(1)}
    }
    method aprenderTecnica(unaTec) = tecnicas.add(unaTec)
    method trabajar(tiempo, unPlaneta) {
        if (unPlaneta.personas().contains(self)) //en el planeta, si las personas que contiene es la misma que pregunta
            self.realizarTecnica(tiempo, tecnicas.last())
    }
}

class Constructor inherits Persona {
    var property cantConstrucciones 
    const property region
    
    override method recursosMonedas() {
        return super() + 10 * cantConstrucciones
    }
    override method esDestacada(){
        return cantConstrucciones > 5
    }
    method construir(unPlaneta) {
        unPlaneta.construcciones().add(region.construccionARealizar(self))
    } 
    method trabajar(tiempo, unPlaneta) {
        self.construir(unPlaneta)
        self.gastarMonedas(5)
    }

}

object montaña {
    method construccionARealizar(unConstructor){
        return new Muralla(longitud = unConstructor.)
    }  
}
