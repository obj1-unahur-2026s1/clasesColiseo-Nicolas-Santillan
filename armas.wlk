import gladiadores.*

class Arma {
    method valorDeAtaque()
}

class ArmaDeFilo inherits Arma {
    const longitud
    var filo

    method filo(nuevoFilo) {
        filo = nuevoFilo
    }

    override method valorDeAtaque() {
        return filo * longitud
    }
}

class ArmaContundente inherits Arma {
    const peso

    override method valorDeAtaque() {
        return peso
    }
}

class Armadura {
    method puntosArmadura(unGladiador)
}

class Casco inherits Armadura {
    override method puntosArmadura(unGladiador) {
        return 10
    }
}

class Escudo inherits Armadura {
    override method puntosArmadura(unGladiador) {
        return 5 + unGladiador.destreza() * 0.1
    }
}

