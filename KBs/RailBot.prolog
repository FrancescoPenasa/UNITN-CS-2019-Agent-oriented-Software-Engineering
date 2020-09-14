:- consult("UnityLogic/KBs/UnityLogicAgentAPI.prolog").


add check_box && (belief from_drone(B))=> [
	check_artifact_belief(B, start(S)),
    check_artifact_belief(B, destination(D)),
    check_agent_belief(S, area(SrcArea)),
    check_agent_belief(D, area(DstArea)),

    SrcArea \= DstArea,

	add_belief(to_move),
   	add_desire(pickupBox(B)),

	del_belief(from_drone(B)),
	stop
].

add check_box && (belief from_drone(B))=> [
	check_artifact_belief(B, start(S)),
    check_artifact_belief(B, destination(D)),
    check_agent_belief(S, area(SrcArea)),
    check_agent_belief(D, area(DstArea)),

   	SrcArea == DstArea,

	add_belief(not_to_move),
   	add_desire(leaveBox(B)),
	
	del_belief(from_drone(B)),
	stop
].


add check_box && (belief from_SB(B))=> [
	add_belief(from_EA),
	add_desire(pickupBox(B)),

	del_belief(from_SB(B)),
	stop
].




add pickupBox(B) && (belief to_move)  => [
	cr goto(B),
	act pickup(B),

	act (getExchangeArea, EA),
	cr goto(EA),
	cr dropDown(EA),

	add_belief(in_exchange),
	add_desire(call_SortingBot(B)),
	del_belief(to_move),

	stop
].

add pickupBox(B) && (belief from_EA)  => [	
	act (getExchangeArea, EA),
	cr goto(EA),
	act pickup(B),

    check_artifact_belief(B, start(S)),
    check_agent_belief(S, area(SrcArea)),
    act (getArea(SrcArea), SA),

	cr goto(SA),
	cr dropDown(SA),

	add_desire(call_Drone(B)),
	add_belief(to_deliver),
	del_belief(from_EA),

	stop
].

add leaveBox(B) && (belief not_to_move)  => [
	add_desire(call_Drone(B)),
	add_belief(to_deliver),

	add_desire(goto_charging_station),
    del_belief(not_to_move),
	stop
].



add call_SortingBot(B) && (belief in_exchange)  => [
	act (getSortingBot(), SB),
	add_agent_belief(SB, box_in_EA(B)),

	add_desire(goto_charging_station),
	del_belief(in_exchange),
	stop
].

add call_Drone(B) && (belief to_deliver)  => [
	act (getDrone(), D),
	(
		not(check_agent_belief(D, isBusy)),
		add_agent_belief(D, isBusy)
	),

	add_agent_desire(D, toDeliver(B)),

	add_desire(goto_charging_station),
	del_belief(to_deliver),
	stop
].



add goto_charging_station && true => [
	act (getChargingStation(), CS),
	cr goTo(CS),

    add_desire(check_box),
	stop
].