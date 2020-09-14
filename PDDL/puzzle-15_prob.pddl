;; 15-puzzle problem
;; problem file: puzzle-15.pddl

(define (problem puzzle-15)
	(:domain puzzle-n)

	;; pos = position in the puzzle 4x4
	;; t_n = tile number
	(:objects  
		pos_00 - position 
		pos_01 - position 
		pos_02 - position 
		pos_03 - position  
		pos_10 - position 
		pos_11 - position 
		pos_12 - position 
		pos_13 - position 
		pos_20 - position  
		pos_21 - position  
		pos_22 - position  
		pos_23 - position 
		pos_30 - position 
		pos_31 - position 
		pos_32 - position 
		pos_33 - position 

		t_1 - tile 
		t_2 - tile  
		t_3 - tile  
		t_4 - tile  
		t_5 - tile  
		t_6 - tile 
		t_7 - tile  
		t_8 - tile  
		t_9 - tile  
		t_10 - tile  
		t_11 - tile  
		t_12 - tile  
		t_13 - tile  
		t_14 - tile  
		t_15 - tile )

	;; init a random order of the tiles
	(:init  (in pos_00 t_15)(in pos_01 t_2)(in pos_02 t_1)(in pos_03 t_12)
			(in pos_10 t_8)(in pos_11 t_5)(in pos_12 t_6)(in pos_13 t_11)
			(in pos_20 t_4)(in pos_21 t_9)(in pos_22 t_10)(in pos_23 t_7)
			(in pos_30 t_3)(in pos_31 t_13)(in pos_32 t_14)(free pos_33) 

			(near pos_00 pos_01)(near pos_01 pos_00)(near pos_00 pos_10)(near pos_10 pos_00) ; pos 00 neighbors
			(near pos_01 pos_02)(near pos_02 pos_01)(near pos_01 pos_11)(near pos_11 pos_01) ; pos 01 neighbors
			(near pos_02 pos_12)(near pos_12 pos_02)(near pos_02 pos_03)(near pos_03 pos_02) ; pos 02 neighbors
			(near pos_03 pos_13)(near pos_13 pos_03)										 ; pos 03 neighbors

			(near pos_10 pos_11)(near pos_11 pos_10)(near pos_10 pos_20)(near pos_20 pos_10) ; pos 10 neighbors
			(near pos_11 pos_12)(near pos_12 pos_11)(near pos_11 pos_21)(near pos_21 pos_11) ; pos 11 neighbors
			(near pos_12 pos_22)(near pos_22 pos_12)(near pos_12 pos_13)(near pos_13 pos_12) ; pos 12 neighbors
			(near pos_13 pos_23)(near pos_23 pos_13)										 ; pos 13 neighbors

			(near pos_20 pos_21)(near pos_21 pos_20)(near pos_20 pos_30)(near pos_30 pos_20) ; pos 20 neighbors
			(near pos_21 pos_22)(near pos_22 pos_21)(near pos_21 pos_31)(near pos_31 pos_21) ; pos 21 neighbors
			(near pos_22 pos_32)(near pos_32 pos_22)(near pos_22 pos_23)(near pos_23 pos_22) ; pos 22 neighbors
			(near pos_23 pos_33)(near pos_33 pos_23)										 ; pos 23 neighbors

			(near pos_30 pos_31)(near pos_31 pos_30)										 ; pos 30 neighbors
			(near pos_31 pos_32)(near pos_32 pos_31)										 ; pos 31 neighbors
			(near pos_32 pos_33)(near pos_33 pos_32)										 ; pos 32 and 33 neighbors
			)

	;; goal 
	(:goal (and (in pos_00 t_1)(in pos_01 t_2)(in pos_02 t_3)(in pos_03 t_4)
				(in pos_10 t_5)(in pos_11 t_6)(in pos_12 t_7)(in pos_13 t_8)
				(in pos_20 t_9)(in pos_21 t_10)(in pos_22 t_11)(in pos_23 t_12)
				(in pos_30 t_13)(in pos_31 t_14)(in pos_32 t_15)(free pos_33)
				))

)