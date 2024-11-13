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
    method trabajar(tiempo, unPlaneta) {}
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
    override method trabajar(tiempo, unPlaneta) {
        if (unPlaneta.personas().contains(self)) //en el planeta, si las personas que contiene es la misma que pregunta
            self.realizarTecnica(tiempo, tecnicas.last())
    }
}

class Constructor inherits Persona {
    var property cantConstrucciones 
    var property region
    const property inteligencia

    
    override method recursosMonedas() {
        return super() + 10 * cantConstrucciones
    }
    override method esDestacada(){
        return cantConstrucciones > 5
    }
    method construir(unPlaneta, tiempoConstruccion) {
        unPlaneta.construcciones().add(region.construccionARealizar(tiempoConstruccion))
    } 
    override method trabajar(tiempo, unPlaneta) {
        self.construir(unPlaneta, tiempo)
        self.gastarMonedas(5)
    }

}

object montana{
  method construccionARealizar(tiempoConstruccion, trabajador) {
    return new Muralla(longitud = tiempoConstruccion / 2)
  }
}

object costa{
  method construccionARealizar(tiempoConstruccion, trabajador) {
    return new Museo(superficieCubierta = tiempoConstruccion, indiceImportancia = 1)
  }
}

object llanura{
  method construccionARealizar(tiempoConstruccion, trabajador) {
    if (trabajador.esDestacado()){
            new Museo(superficieCubierta = tiempoConstruccion, indiceImportancia = trabajador.monedas() / 10)
        }else{
            new Muralla(longitud = tiempoConstruccion / 2)
        }
  }
}

object pantano{
  method construccionARealizar(tiempoConstruccion, trabajador) {
        if (trabajador.inteligencia() > 11) {
            new Muralla(longitud = tiempoConstruccion / 4)
    }else {
        new Muralla(longitud = 1)
    }
  }
}

/*
OTRA OPCION??? NO SABEMOS
class Region {
    method construccionARealizar(tiempo, construc) {}
}

object Montana inherits Region {
    override method construccionARealizar(tiempo, construc) {
        return new Muralla(longitud = tiempo / 2)
    } 
}

object Costa inherits Region {
    override method construccionARealizar(tiempo, construc) {
        return new Museo(superficieCubierta = tiempo, indiceImportancia = 1)
    } 
}

object Llanura inherits Region {
    override method construccionARealizar(tiempo, construc) {
        if (construc.esDestacado()){
            new Museo(superficieCubierta = tiempo, indiceImportancia = construc.monedas() / 10)
        }else{
            new Muralla(longitud = tiempo / 2)
        }
    }
}

object isla inherits Region {
    override method construccionARealizar(tiempo, construc) {
        if (construc.inteligencia() > 5) {
            new Muralla(longitud = tiempo / 2)
    }else {
        new Museo(superficieCubierta = tiempo, indiceImportancia = 1)
    }
}
*/

