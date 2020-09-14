;; 8-puzzle problem
;; problem file: puzzle-8.pddl

(define (problem puzzle-8)
	(:domain puzzle-n)

	;; pos = position in the puzzle 3x3
	;; t_n = tile number
	(:objects 
		pos_00 - position 
		pos_01 - position 
		pos_02 - position  
		pos_10 - position 
		pos_11 - position 
		pos_12 - position 
		pos_20 - position  
		pos_21 - position  
		pos_22 - position 

		t_1 - tile 
		t_2 - tile  
		t_3 - tile  
		t_4 - tile  
		t_5 - tile  
		t_6 - tile 
		t_7 - tile  
		t_8 - tile )

	;; init a random order of the tiles
	(:init  (in pos_00 t_2)(in pos_01 t_6)(in pos_02 t_1)
			(free pos_10)(in pos_11 t_7)(in pos_12 t_8)
			(in pos_20 t_3)(in pos_21 t_5)(in pos_22 t_4) 

			(near pos_00 pos_01)(near pos_01 pos_00)(near pos_00 pos_10)(near pos_10 pos_00) ; pos 00 neighbors
			(near pos_01 pos_02)(near pos_02 pos_01)(near pos_01 pos_11)(near pos_11 pos_01) ; pos 01 neighbors
			(near pos_02 pos_12)(near pos_12 pos_02)										 ; pos 02 neighbors

			(near pos_10 pos_11)(near pos_11 pos_10)(near pos_10 pos_20)(near pos_20 pos_10) ; pos 10 neighbors
			(near pos_11 pos_12)(near pos_12 pos_11)(near pos_11 pos_21)(near pos_21 pos_11) ; pos 11 neighbors
			(near pos_12 pos_22)(near pos_22 pos_12)										 ; pos 12 neighbors
			
			(near pos_20 pos_21)(near pos_21 pos_20)										 ; pos 20 neighbors
			(near pos_21 pos_22)(near pos_22 pos_21)										 ; pos 21 and 22 neighbors
)
	;; goal ordered puzzle
	(:goal (and (in pos_00 t_1)(in pos_01 t_2)(in pos_02 t_3)
				(in pos_10 t_4)(in pos_11 t_5)(in pos_12 t_6)
				(in pos_20 t_7)(in pos_21 t_8)(free pos_22) ))

)