:- consult("UnityLogic/KBs/UnityLogicAgentAPI.prolog").

add call_drone(B) && true => [
	act (getDrone, D),
	(
        not(check_agent_belief(D, isBusy)),
        add_agent_belief(D, isBusy)
    ),

	add_agent_desire(D, pickupBox(B)),
	
	stop
].

add destroy_box(B) && (belief box_delivered) => [

    act destroy(B),
    del_belief(box_delivered),

    stop
].