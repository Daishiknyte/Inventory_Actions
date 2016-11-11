/*
 * Author: Daishiknyte
 * Converts everyBackpack into a format usable for referencing the inventory
 * dialog lists.
 *
 * Arguments:
 * 0: _backpacksList <ARRAY>
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

 params ["_backpacksList"];

 diag_log format ["===================="];
 diag_log format ["fnc_filterInventoryBackpacks"];
 diag_log format ["   params : %1", _backpacksList];
 diag_log format ["   iCount : %1", count _backpacksList];

 private _filteredList = [];

 {
     _filteredList pushBack ["b", typeOf _x, 1, _x];
 } forEach _backpacksList;

// Return
_filteredList
