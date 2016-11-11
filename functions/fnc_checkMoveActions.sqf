/*
 * Author: Daishiknyte
 * Checks for valid "Move To" actions.
 *
 * Arguments:
 * 0: _controlClickedIDC <SCALAR>
 * 1: _itemData <ARRAY>
 *
 * Return Value:
 * _availableActions
 *
 * Example:
 * ["example"] call ace_[module]_fnc_[functionName]
 *
 * Public: No
 */

 #include "script_component.hpp"

 params ["_itemData"];
 _itemData params ["_iType", "_itemClass", "_count", "_extraData"];

 private _canAddTo = [];
 {
     if !(isNull _x) then {
         for "_i" from _count to 0 step -1 do {
             if (_x canAdd [_itemClass, _i]) exitWith {
                 _canAddTo pushBack _i;
             };
         };
     } else {
         _canAddTo pushBack 0;
     }
 } forEach [uniformContainer ACE_player, vestContainer ACE_player,
            backpackContainer ACE_player, GVAR(primaryContainer),
            GVAR(secondaryContainer)];
;

 // Return
 _canAddTo
