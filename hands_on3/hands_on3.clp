;;AGUAYO ALCALA DIEGO ARMANDO
(deftemplate signoSintoma
    (slot nombre)
)

(defrule diagnostico
    (sintomas-ingresados 4)
    (or (diagnosticoGripe)
        (diagnosticoMigraña)
        (diagnosticoCovid-19)
        (diagnosticoBronquitis)
        (diagnosticoHipertension)
        (diagnosticoInfeccionPiel))
    =>
    (printout t "Diagnóstico completo." crlf)
)

(defrule ingresar-sintoma
    (not (sintomas-ingresados 4))
    =>
    (printout t "Ingrese un síntoma: " crlf)
    (bind ?sintoma (read))
    (assert (signoSintoma (nombre ?sintoma)))
    (printout t "Ingrese un síntoma: " crlf)
    (bind ?sintoma (read))
    (assert (signoSintoma (nombre ?sintoma)))
    (printout t "Ingrese un síntoma: " crlf)
    (bind ?sintoma (read))
    (assert (signoSintoma (nombre ?sintoma)))
    (printout t "Ingrese un síntoma: " crlf)
    (bind ?sintoma (read))
    (assert (signoSintoma (nombre ?sintoma)))
)

(defrule regla-inicial
    =>
    (printout t "Por favor, proporcione cuatro síntomas." crlf)
    (assert (sintomas-ingresados 0))
)

(defrule diagnosticoGripe
    (signoSintoma (nombre fiebre))
    (signoSintoma (nombre dolor_garganta))
    (signoSintoma (nombre congestion_nasal))
    (signoSintoma (nombre tos))
    =>
    (printout t "Diagnóstico: Gripe" crlf)
)

(defrule diagnosticoMigraña
    (signoSintoma (nombre fatiga))
    (signoSintoma (nombre irritabilidad))
    (signoSintoma (nombre dolor_cabeza))
    (signoSintoma (nombre baja_tolerancia_luz))
    =>
    (printout t "Diagnóstico: Migraña" crlf)
)

(defrule diagnosticoCovid-19
    (signoSintoma (nombre dolor_garganta))
    (signoSintoma (nombre calentura))
    (signoSintoma (nombre fiebre))
    (signoSintoma (nombre perdida_sentidos))
    =>
    (printout t "Diagnóstico: Covid-19" crlf)
)

(defrule diagnosticoBronquitis
    (signoSintoma (nombre tos))
    (signoSintoma (nombre mucosidad))
    (signoSintoma (nombre dolor_pecho))
    (signoSintoma (nombre dolor_garganta))
    =>
    (printout t "Diagnóstico: Bronquitis" crlf)
)

(defrule diagnosticoHipertension
    (signoSintoma (nombre dolor_cabeza))
    (signoSintoma (nombre mareos))
    (signoSintoma (nombre fatiga))
    (signoSintoma (nombre vision_borrosa))
    =>
    (printout t "Diagnóstico: Hipertensión" crlf)
)

(defrule diagnosticoInfeccionPiel
    (signoSintoma (nombre enrojecimiento))
    (signoSintoma (nombre inflamacion))
    (signoSintoma (nombre ardor))
    (signoSintoma (nombre lesiones_subcutaneas))
    =>
    (printout t "Diagnóstico: Infección en la piel" crlf)
)
