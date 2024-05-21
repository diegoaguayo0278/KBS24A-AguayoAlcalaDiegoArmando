;; Definiendo una plantilla para representar/modelar productos en la memoria de trabajo de Jess

(deftemplate product
  (slot part-number)
  (slot name)
  (slot category)
  (slot price)
)

;; Almacenando cinco productos (o cinco hechos) en la memoria de trabajo de Jess mediante la función deffacts

(deffacts products 
        (product (name "USB Memory") (category storage) (part-number 1234) (price 9.99))
        (product (name "Amplifier") (category electronics) (part-number 2341) (price 399.99))
        (product (name "Speakers") (category electronics) (part-number 23241) (price 19.99))
        (product (name "iPhone 7") (category smartphone) (part-number 3412) (price 99.99))
        (product (name "Samsung Edge 7") (category smartphone) (part-number 34412) (price 88.99))
)

;; Definiendo una plantilla para representar/modelar clientes en la memoria de trabajo de Jess

(deftemplate customer
  (slot customer-id)
  (multislot name)
  (multislot address)
)

;; Almacenando tres clientes (o tres hechos) en la memoria de trabajo de Jess mediante la función deffacts

(deffacts customers
  (customer (customer-id 101) (name "joe smith") (address "bla bla bla"))
  (customer (customer-id 102) (name "mary") (address "bla bla bla"))
  (customer (customer-id 103) (name "bob") (address "bla bla bla"))
)
