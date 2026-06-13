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
}

class Mirmillon inherits Gladiador {
    var arma
    var armadura

    const fuerza
    const destreza = 15

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
        return armadura.puntosDeDefensa() + destreza
    }
}

class Dimachaerus inherits Gladiador {
    var armas = []

    const fuerza = 10
    var destreza 

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

}