;; Defining a rule for finding customer names and printing such names
(defrule my-rule11
   (customer (name ?n)) => (printout t "Nombre del cliente encontrado: " ?n  crlf ))

;; Defining a rule for finding a customer's data via their customer-id
;; you can replace the customer-id 101 with either 102 or 103 (see deffacts customers)
(defrule my-rule12
   ?c <- (customer (customer-id 101))
   =>
   (printout t "El customer-id 101 pertenece a: " ?c.name " con dirección: " ?c.address crlf))

;;Defining a rule for finding "electronic products"
(defrule my-rule13
   (product (category electronics) (name ?name))
   =>
   (printout t "Producto electrónico encontrado: " ?name crlf))

;; Defining a rule for finding smartphones cheaper than 50 dlls
;; note the use of NOT, if Jess does not find a match for a given pattern then the rule returns a FALSE
;; however you can use NOT for making the rule to return true
(defrule my-rule14
   (not (product (category smartphone) (price < 50) (name ?n)))
   =>
   (printout t "No hay smartphones más baratos que 50 dlls" crlf ))

;; Defining a rule for finding smartphones cheaper than 100 dlls
(defrule my-rule15
   (product (category smartphone) (price < 100) (name ?n))
   =>
   (printout t ?n " es más barato que 100 dlls" crlf ))
