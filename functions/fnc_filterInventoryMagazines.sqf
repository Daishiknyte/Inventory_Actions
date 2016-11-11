/*
 * Author: Daishiknyte
 * Converts magazinesAmmoCargo into a format usable for referencing the inventory
 * dialog lists.
 *
 * Arguments:
 * 0: _magazinesList <ARRAY>
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

params ["_magazinesList"];

private _filteredList = [];
private _curr = [];
private _next = [];
private _counter = 1;
private _iCount = count _magazinesList;

diag_log format ["===================="];
diag_log format ["fnc_filterInventoryMagazines"];
diag_log format ["   params : %1", _magazinesList];
diag_log format ["   iCount : %1", _iCount];

switch (_iCount) do {
    case (0): {
        diag_log format ["   Case 0"];
         diag_log format ["     Do nothing."];
     };

     case (1): {
         diag_log format ["   Case 1"];
         diag_log format ["     Mags : %1 | %2", _magazinesList select 0, "n/a"];
         _filteredList pushBack ["m", _magazinesList select 0 select 0, 1, _magazinesList select 0 select 1];
     };

     case (2): {
         diag_log format ["   Case 2"];
         diag_log format ["     Mags : %1 | %2", _magazinesList select 0, _magazinesList select 1];
         _curr = _magazinesList select 0;
         _next = _magazinesList select 1;

         if (_next isEqualTo _curr) then {
             _filteredList pushBack ["m", _curr select 0, 2, _curr select 1];
         } else {
             _filteredList pushBack ["m", _curr select 0, 1, _curr select 1];
             _filteredList pushBack ["m", _next select 0, 1, _next select 1];
         };
     };

     default {
         diag_log format ["   Case Default"];
         _curr = _magazinesList select 0;
         for "_i" from 1 to (_iCount - 2) do {
             _next = _magazinesList select _i;
             diag_log format ["     Mags : %1 | %2", _curr, _next];

             if (_next isEqualTo _curr) then {
                 _counter = _counter + 1;
             } else {
                 _filteredList pushBack ["m", _curr select 0, _counter, _curr select 1];
                 _counter = 1;
             };

             _curr = _next;
         };

         // Special Case - Last two indices
         _next = _magazinesList select (_iCount-1);
         diag_log format ["     Mags : %1 | %2", _curr, _next];
         if (_next isEqualTo _curr) then {
             _filteredList pushBack ["m", _curr select 0, _counter + 1, _curr select 1];
         } else {
             _filteredList pushBack ["m", _curr select 0, _counter, _curr select 1];
             _filteredList pushBack ["m", _next select 0, 1, _next select 1];
         };
    };
};

// Return
_filteredList
