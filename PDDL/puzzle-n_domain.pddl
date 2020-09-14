;; PDDL  domain  for  solving  problems  concerning  the  famous n-puzzle board game

;; domain file: puzzle-n_domain.pddl
(define (domain puzzle-n)
  (:requirements :typing)
  (:types position tile)
  (:predicates (in ?pos - position ?t - tile)
               (free ?pos - position)
               (near ?pos_1 - position ?pos_2 - position))

  (:action move
    :parameters   (?t - tile ?from - position ?to - position)
    :precondition (and (free ?to) (in ?from ?t) (near ?from ?to)) ;near (?to ?from)
    :effect       (and (free ?from) (not (free ?to)) (in ?to ?t) (not (in ?from ?t)))) ; near (?from ?to) don't swap
)