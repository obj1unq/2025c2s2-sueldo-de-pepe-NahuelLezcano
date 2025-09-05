object pepe {

	var categoria = cadete 
    var property vecesQueFalto = 0
    var property sueldoNeto = categoria.sueldo()
    var bonoResultado = bonoNulo
    var bonoPresentismo = bonoNulo


    // Bono por resultado
    method aplicarBonoPorResultadoPorcentual() {
        bonoResultado = bonoPorResultadoPorcentual
    }

    method aplicarBonoPorResultadoFijo() {
        bonoResultado = bonoPorResultadoFijo
    }


    // Bono por presentismo
    method aplicarBonoPorPresentismoNormal() {
        bonoPresentismo = bonoPorPresentismoNormal
    }

    method aplicarBonoPorPresentismoAjuste() {
        bonoPresentismo = bonoPorPresentismoAjuste
    }

    method aplicarBonoPorPresentismoDemagogico() {
        bonoPresentismo = bonoPorPresentismoDemagogico
    }

    
    method sueldoBruto() = sueldoNeto + bonoResultado.montoPara(self) + bonoPresentismo.montoPara(self)

    method categoria() = categoria

    method faltarVeces(veces) {
        vecesQueFalto += veces
    }
    
    method categoria(_categoria) {
        categoria = _categoria
        sueldoNeto = categoria.sueldo()
    }
}


// Categorias

object cadete {
    const property sueldo = 20000
}


object gerente {
    const property sueldo = 15000 
}


// Bonos

object bonoNulo {
    method montoPara(empleado) = 0
}


object bonoPorResultadoPorcentual {
    method montoPara(empleado) {
        return empleado.sueldoNeto() * 0.10
    }
}


object bonoPorResultadoFijo {
    method montoPara(empleado) = 800
}



object bonoPorPresentismoNormal {
    method montoPara(empleado) {
        const faltas = empleado.vecesQueFalto()
        var monto = 2000
        
        if(faltas > 1) {
            monto = 0
        } 
        else if(faltas == 1) {
            monto = 1000
        }

        return monto
    }
}


object bonoPorPresentismoAjuste {
    method montoPara(empleado) {
        var monto = 100

        if(empleado.vecesQueFalto() >= 1) {
            monto = 0
        }

        return monto
    }
}


object bonoPorPresentismoDemagogico {
    method montoPara(empleado) {
        if(empleado.sueldoNeto() < 18000) {
            return 500
        } else {
            return 300
        }
    }
}