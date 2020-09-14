:- consult("UnityLogic/KBs/UnityLogicAgentAPI.prolog").

add pickupBox(B) && (\+ belief has_box) =>[
    cr takeoff(),
	cr goto(B),
	cr land(),
	act pickup(B),

	add_belief(has_box),
	add_desire(send_to_RailBot(B)),

	stop
].

add send_to_RailBot(B) && (belief has_box) => [
	check_artifact_belief(B, start(S)),
    check_artifact_belief(B, destination(D)),
    check_agent_belief(S, area(SrcArea)),
    check_agent_belief(D, area(DstArea)),

	act (getLandingZone(SrcArea, DstArea), LandingArea),

    cr takeOff(),
    cr goTo(LandingArea),
    cr land(),
    act dropDown(),

    add_belief(box_from(SrcArea)),
    add_desire(call_railbot(B)),
    del_belief(has_box),

    stop
].

add call_railbot(B) && (belief box_from(SrcArea)) => [
    
    act (getRailBot(SrcArea), RB),

    add_agent_desire(RB, check_box),
    add_agent_belief(RB, from_drone(B)),    

    add_desire(goto_charging_station),

    del_belief(box_from(SrcArea)),

    stop
].

add goto_charging_station && true => [
    act (getChargingStation(), CS),

    cr takeOff(),
    cr goTo(CS),
    cr land(),

    del_belief(isBusy),
    stop
].


add toDeliver(B) && true => [
    cr takeOff(),
    cr goTo(B),
    cr land(),
    act pickup(B),

    add_belief(has_box),
	add_desire(deliver(B)),

	stop
].

add deliver(B) && (belief has_box) =>[
	check_artifact_belief(B, destination(Dst)),

    cr takeoff(),
	cr goto(Dst),
	cr land(),
	act dropdown(),
	add_desire(goto_charging_station),

    add_agent_belief(Dst, box_delivered),
	add_agent_desire(Dst, destroy_box(B)), 
    
	del_belief(has_box),

	stop
].