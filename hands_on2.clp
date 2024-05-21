;;AGUAYO ALCALA DIEGO ARMANDO
(deftemplate enfermedad
    (slot id)
    (slot nombre)
    (multislot signos)
    (multislot sintomas)
)

(deffunction consultar (?id)
)

(defrule inicio
  =>
  (printout t "¡Bienvenido al sistema de enfermedades!" crlf)
  (assert (enfermedad (id 1) (nombre "Gripe") (signos fiebre dolor-garganta) (sintomas congestion-nasal tos)))
  (assert (enfermedad (id 2) (nombre "Migraña") (signos fatiga irritabilidad) (sintomas dolor-cabeza baja-tolerancia-luz)))
  (assert (enfermedad (id 3) (nombre "Covid-19") (signos dolor-garganta calentura) (sintomas fiebre perdida-sentidos)))
  (assert (enfermedad (id 4) (nombre "Bronquitis") (signos tos mucosidad) (sintomas dolor-pecho dolor-garganta)))
  (assert (enfermedad (id 5) (nombre "Hipertensión") (signos dolor-cabeza mareos) (sintomas fatiga vision-borrosa)))
  (assert (enfermedad (id 6) (nombre "Infeccion-Piel") (signos enrojecimiento inflamacion) (sintomas ardor lesiones-subcutaneas)))
  (assert (mostrar-lista))
  (assert (iniciar))
)

(defrule mostrar-lista
  (iniciar)
  =>
  (printout t "Lista de enfermedades:" crlf)
  (assert (mostrar-lista))
  (do-for-all-facts ((?enfermedad enfermedad)) TRUE
    (printout t "ID: " (fact-slot-value ?enfermedad id) ", Nombre: " (fact-slot-value ?enfermedad nombre) crlf)
  )
)

(defrule eliminar-enfermedad
  (not (eliminar ?))
  =>
  (printout t "Ingrese el ID de la enfermedad que desea eliminar (o '0' para salir): ")
  (assert (eliminar (read)))
)

(defrule eliminar-datos
   (eliminar ?id)
   ?enfermedad <- (enfermedad (id ?id))
   =>
   (printout t "Enfermedad eliminada." crlf)
   (retract ?enfermedad)
   (assert (mostrar-lista))
)

(defrule consultar-enfermedad
  (not (consultar ?))
  =>
  (printout t "Lista de enfermedades:" crlf)
  (assert (enfermedad (id 1) (nombre "Gripe") (signos fiebre dolor-garganta) (sintomas congestion-nasal tos)))
  (assert (enfermedad (id 2) (nombre "Migraña") (signos fatiga irritabilidad) (sintomas dolor-cabeza baja-tolerancia-luz)))
  (assert (enfermedad (id 3) (nombre "Covid-19") (signos dolor-garganta calentura) (sintomas fiebre perdida-sentidos)))
  (assert (enfermedad (id 4) (nombre "Bronquitis") (signos tos mucosidad) (sintomas dolor-pecho dolor-garganta)))
  (assert (enfermedad (id 5) (nombre "Hipertensión") (signos dolor-cabeza mareos) (sintomas fatiga vision-borrosa)))
  (assert (enfermedad (id 6) (nombre "Infeccion-Piel") (signos enrojecimiento inflamacion) (sintomas ardor lesiones-subcutaneas)))
  (assert (mostrar-lista))
  (assert (iniciar))
  (do-for-all-facts ((?enfermedad enfermedad)) TRUE
    (printout t "ID: " (fact-slot-value ?enfermedad id) ", Nombre: " (fact-slot-value ?enfermedad nombre) crlf)
  )
  (printout t "Por favor, ingrese el ID de la enfermedad que desea consultar (o '0' para salir): ")
  (assert (consultar (read)))
)

(defrule mostrar-detalles
  (consultar ?id)
  ?enfermedad <- (enfermedad (id ?id))
  =>
  (assert (mostrar-lista))
  (printout t crlf "Detalles de la enfermedad:" crlf)
  (printout t "ID: " (fact-slot-value ?enfermedad id) crlf)
  (printout t "Nombre: " (fact-slot-value ?enfermedad nombre) crlf)
  (printout t "Signos: " (implode$ (fact-slot-value ?enfermedad signos)) crlf)
  (printout t "Síntomas: " (implode$ (fact-slot-value ?enfermedad sintomas)) crlf)
  (assert (mostrar-lista))
)

(defrule salir
  (or (consultar 0) (eliminar 0))
  =>
  (halt)
)
