import armas.*

class Gladiador {
    var vida = 100

    method vida() = vida
    method arma()

    method recibirDanio(cantidad) {
        vida = vida - cantidad.max(0)
    }

    method ataque()
    method atacar(unGladiador)
    method defensa()

    method puedeCombatir() {
        return vida > 0
    }

    method pelearCon(unGladiador) {
        self.atacar(unGladiador)
        if(unGladiador.puedeCombatir()) {
            unGladiador.atacar(self)
        }
    }

    method curar() {
        vida = 100
    }

    method crearGrupoCon(unGladiador)
}

class Mirmillon inherits Gladiador {
    var arma
    var armadura

    const fuerza
    const destreza = 15

    method destreza() = destreza

    method cambiarArma(nuevaArma) {
        arma = nuevaArma
    }
    method cambiarArmadura(nuevaArmadura) {
        armadura = nuevaArmadura
    }

    override method ataque() {
        return arma.valorDeAtaque() + fuerza
    }

    override method atacar(unGladiador) {
        unGladiador.recibirDanio(self.ataque() - unGladiador.defensa())
    }

    override method defensa() {
        return armadura.puntosDeDefensa(self) + destreza
    }

    override method crearGrupoCon(unGladiador) {
        return new Grupo(nombre='mirmillolandia')
                Grupo.agregarMiembro(self)
                Grupo.agregarMiembro(unGladiador)

    }
}

class Dimachaerus inherits Gladiador {
    var armas = []

    const fuerza = 10
    var destreza 

    method destreza() = destreza

    method agregarArma(unArma) {
        armas.add(unArma)
    }

    override method ataque() {
        return fuerza + armas.sum({ a => a.valorDeAtaque() })
    }

    override method atacar(unGladiador) {
        unGladiador.recibirDanio(self.ataque() - unGladiador.defensa())
        destreza = destreza + 1
    }

    override method defensa() {
        return destreza * 0.5
    }

    override method crearGrupoCon(unGladiador) {
        return new Grupo(nombre="D-" + (self.ataque() + unGladiador.ataque()))
    }
}

class Grupo {
    const nombre
    var gladiadores = []
    var cantidadDePeleas = 0

    method agregarMiembro(unGladiador) {
        gladiadores.add(unGladiador)
    }

    method quitarMiembro(unGladiador) {
        gladiadores.remove(unGladiador)
    }

    method gladiadoresQuePuedenCombatir() {
        return gladiadores.filter({g => g.puedeCombatir()})
    }

    method elegirCampeon() {
        return self.gladiadoresQuePuedenCombatir().max({g => g.ataque()})
    }

    method combatirContra(unGrupo) {
        cantidadDePeleas += 1

    }
}
