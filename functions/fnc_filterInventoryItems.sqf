/*
 * Author: Daishiknyte
 * Converts getItemCargo into a format usable for referencing the inventory
 * dialog lists.
 *
 * Arguments:
 * 0: _itemsList <ARRAY>
 * 1: _containersList <ARRAY>
 *
 * Return Value:
 * _filteredList <ARRAY>
 *
 * Example:
 * ["example"] call ace_[module]_fnc_[functionName]
 *
 * Public: Yes
 */

#include "script_component.hpp"

params ["_itemsArray", "_containersList"];
_itemsArray params ["_itemsList", "_itemsCounts"];

private _filteredList = [];
private _curr = [];
private _next = [];
private _containerCounter = 0;
private _iCount = count _itemsList;

diag_log format ["===================="];
diag_log format ["fnc_filterInventoryItems"];
diag_log format ["   params : %1 | %2", _itemsArray, _containersList];
diag_log format ["   iCount : %1", _iCount];

for "_i" from 0 to (_iCount - 1) do {
 if ([_itemsList select _i] call FUNC(isUniformOrVest)) then {
     for "_j" from 0 to (_itemsCounts select _i) do {
         _filteredList pushBack ["ic", _itemsList select _i, 1, _containersList select _containerCounter];
         _containerCounter = _containerCounter + 1;
     };
 } else {
     _filteredList pushBack ["ii", _itemsList select _i, _itemsCounts select _i, []];
 };
};

// Return
_filteredList
