;; Initialize working memory
(reset)

;; Defining rules
(defrule r1 (hecho a) => (assert (hecho b)))
(defrule r2 (hecho b) => (assert (hecho c)))
(defrule r3 (hecho c) => (assert (hecho d)))
(defrule r4 (hecho d) => (assert (hecho e)))

;; Indicar el hecho 'a'
(assert (hecho a))

;; Llamar al motor de inferencia
(run)
