;;AGUAYO ALCALA DIEGO ARMANDO
(deftemplate smartphone
   (slot brand)
   (slot model)
   (slot color)
   (slot price))

(deftemplate computer
   (slot brand)
   (slot model)
   (slot color)
   (slot price))

(deftemplate accessory
   (slot type)
   (slot compatible-with)
   (slot price))

(deftemplate client
   (slot id)
   (slot name)
   (slot segment))

(deftemplate order
   (slot client-id)
   (multislot items)
   (slot payment-method)
   (slot total-amount))

(deftemplate credit-card
   (slot bank)
   (slot type)
   (slot expiration-date))

(deftemplate voucher
   (slot value)
   (slot expiration-date))

;; Hechos iniciales
(deffacts initial-facts
   (smartphone (brand apple) (model iPhone15) (color rojo) (price 17000))
   (smartphone (brand samsung) (model Note12) (color negro) (price 15000))
   (computer (brand apple) (model MacBookAir) (color gris) (price 25000))
   (accessory (type funda) (compatible-with iPhone15) (price 500))
   (accessory (type mica) (compatible-with iPhone15) (price 300))
   (client (id 1) (name Juan Perez) (segment menudista))
   (client (id 2) (name Maria Lopez) (segment mayorista))
   (credit-card (bank banamex) (type visa) (expiration-date 01-12-23))
   (credit-card (bank liverpool) (type visa) (expiration-date 01-01-25)))

;; Reglas de negocio
(defrule offer-iphone15-banamex
   (order (items ?items) (payment-method (credit-card (bank banamex) (type visa))) 
          (items $? (smartphone (brand apple) (model iPhone15) ?details) $?))
   =>
   (printout t "Oferta: 24 meses sin intereses con tarjeta Banamex para iPhone 15." crlf))

(defrule offer-samsung-note12-liverpool
   (order (items ?items) (payment-method (credit-card (bank liverpool) (type visa))) 
          (items $? (smartphone (brand samsung) (model Note12) ?details) $?))
   =>
   (printout t "Oferta: 12 meses sin intereses con tarjeta Liverpool VISA para Samsung Note 12." crlf))

(defrule offer-macbook-iphone-vouchers
   (order (items ?items) (payment-method (type contado)) 
          (items $? (smartphone (brand apple) (model iPhone15) ?details1) 
                 (computer (brand apple) (model MacBookAir) ?details2) $?)
          (total-amount ?total))
   (test (> ?total 0))
   =>
   (bind ?vouchers (/ ?total 1000))
   (assert (voucher (value (* ?vouchers 100)) (expiration-date 01-01-25)))
   (printout t "Oferta: 100 pesos en vales por cada 1000 pesos de compra de MacBook Air y iPhone 15." crlf))

(defrule offer-accessory-discount
   (order (items ?items)
          (items $? (smartphone ?details) $?)
          (total-amount ?total))
   =>
   (assert (accessory-discount 15))
   (printout t "Oferta: 15% de descuento en funda y mica para smartphone." crlf))

;; Más reglas de negocio...

;; Ejemplo de una orden de compra
(deffacts example-order
   (order (client-id 1)
          (items (smartphone (brand apple) (model iPhone15) (color rojo) (price 17000))
                 (computer (brand apple) (model MacBookAir) (color gris) (price 25000)))
          (payment-method (credit-card (bank banamex) (type visa)))
          (total-amount 42000)))

(reset)
(run)
