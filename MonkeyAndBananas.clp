;;AGUAYO ALCALA DIEGO ARMANDO
(deftemplate state
   (slot monkey)
   (slot chair)
   (slot desk)
   (slot banana)
   (slot status))

(deffacts initial-state
   (state
      (monkey floor)
      (chair floor)
      (desk floor)
      (banana ceiling)
      (status hungry)))

(defrule monkey-climb-chair
   (state (monkey floor) (chair floor))
   =>
   (modify 0 (monkey chair))
   (printout t "Monkey climbs the chair" crlf))

(defrule move-chair-to-desk
   (state (monkey chair) (chair floor) (desk floor))
   =>
   (modify 0 (chair desk))
   (printout t "Monkey moves the chair to the desk" crlf))

(defrule monkey-climb-down
   (state (monkey chair))
   =>
   (modify 0 (monkey floor))
   (printout t "Monkey climbs down from the chair" crlf))

(defrule monkey-push-chair-to-desk
   (state (monkey floor) (chair desk))
   =>
   (modify 0 (chair desk))
   (printout t "Monkey pushes the chair to the desk" crlf))

(defrule monkey-climb-chair-at-desk
   (state (monkey floor) (chair desk) (desk floor))
   =>
   (modify 0 (monkey chair))
   (printout t "Monkey climbs the chair at the desk" crlf))

(defrule monkey-grab-banana
   (state (monkey chair) (chair desk) (banana ceiling))
   =>
   (modify 0 (banana hand))
   (printout t "Monkey grabs the banana" crlf))

(defrule monkey-eat-banana
   (state (banana hand))
   =>
   (modify 0 (banana eaten) (status happy))
   (printout t "Monkey eats the banana" crlf))

(defrule monkey-sit-on-chair
   (state (monkey chair) (chair desk))
   =>
   (modify 0 (monkey sitting))
   (printout t "Monkey sits on the chair" crlf))

(defrule achieve-goal-state
   (state (monkey sitting) (banana eaten) (status happy))
   =>
   (printout t "Goal state achieved: Monkey is happy, chair is on the desk, monkey is sitting on the chair, and banana is eaten." crlf))

(defrule reset-state
   =>
   (retract 0)
   (assert (state (monkey floor) (chair floor) (desk floor) (banana ceiling) (status hungry)))
   (printout t "State has been reset." crlf))
