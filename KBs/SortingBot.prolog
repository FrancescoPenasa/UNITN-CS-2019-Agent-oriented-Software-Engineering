:- consult("UnityLogic/KBs/UnityLogicAgentAPI.prolog").

desire sortBox.

add sortBox && (belief box_in_EA(B)) =>[
  cr goto(B),
  act pickup(B),

  check_artifact_belief(B, destination(D)),
  check_agent_belief(D, area(Dst)), 

  act (getExchangeArea(Dst),EA),
  cr goto(EA), 
  act dropdown(EA),

  add_desire(call_railbot(B)),
  del_belief(box_in_EA(B)),

  stop
].


add call_railbot(B) && true =>[

  check_artifact_belief(B, destination(D)),
  check_agent_belief(D, area(DstArea)),

  act (getRailBot(DstArea), RB),
  add_agent_belief(RB, from_SB(B)),

  add_desire(goto_charging_station),

  stop
].


add goto_charging_station && true => [
  act (getChargingStation(), CS),
  cr goTo(CS),
  
  add_desire(sortBox),

  stop
].
