import personas.*
import construcciones.*

class Planeta {
    const property personas = []
    const property construcciones = []

    method delegacionDiplomatica() {
        const personaConMasRecursos = personas.max({p => p.recursosMonedas()})
        const personasDestacadas = personas.filter({p => p.esDestacada()})
        if (not personaConMasRecursos.esDestacada()){
            personasDestacadas.add(personaConMasRecursos)
        }
        return personasDestacadas
    }
    method esValioso() {
      construcciones.sum({c => c.valor()}) > 100
    }

}