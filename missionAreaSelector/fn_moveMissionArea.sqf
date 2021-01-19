params ["_newMissionPos"];

_oldMissionPos = getPos patrolCenter;

_synchronizedMoveableObjects = (synchronizedObjects patrolCenter) select {typeOf _x == "LOGIC" && {_x getVariable "logicType" == "placer" && {(_x getVariable ["dynamic", true])}}};
_synchronizedMoveableObjects append ((synchronizedObjects patrolCenter) select {(typeOf _x) find "EmptyDetector" == 0}); // Triggers

{
    _objectPos = getPos _x;
    _dX = (_objectPos select 0) - (_oldMissionPos select 0);
    _dY = (_objectPos select 1) - (_oldMissionPos select 1);

    _newObjectPos = [(_newMissionPos select 0) + _dX, (_newMissionPos select 1) + _dY];

    _x setPos _newObjectPos;
} forEach _synchronizedMoveableObjects;

patrolCenter setPos _newMissionPos;