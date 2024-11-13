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