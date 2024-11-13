import personas.*
import planeta.*

class Muralla {
    var property longitud

    method valor() =  longitud * 10
}

class Museo {
    const property superficieCubierta
    const property indiceImportancia

    method indiceImportancia(){
        if ((indiceImportancia >= 1) and (indiceImportancia <= 5)){
            self.error("Indice incorrecto. El indice de importancia no cumple la condición de 1 a 5.")
        }
        return indiceImportancia
    }
    method valor() = superficieCubierta * indiceImportancia
}