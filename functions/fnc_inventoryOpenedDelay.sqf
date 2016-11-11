/*
 * Author: Daishiknyte
 * Handles the delay between the InventoryOpened eventHandler and the display dialog existing.
 *
 * Arguments:
 * 0: _unit <TYPE>
 * 1: _primaryContainer <TYPE>
 * 2: _secondaryContainer <TYPE>
 *
 * Return Value:
 * <None>
 *
 * Example:
 * _this call ace_inventory_actions_inventoryOpenedDelay;
 *
 * Public: No
 */

#include "script_component.hpp"

diag_log "==================================================";

params ["_unit", "_primaryContainer", "_secondaryContainer"];

private _startTime = diag_tickTime;
[
   {!(isNull DISPLAY_INVENTORY) || diag_tickTime > ((_this Select 0) + DISPLAY_TIMEOUT)},
   {
       if !(isNull DISPLAY_INVENTORY) then {
           diag_log format ["INVENTORY OPENED"];
           [_this select 1, _this select 2] call FUNC(inventoryOpened);
       };
   },
   [_startTime, _primaryContainer, _secondaryContainer]
] call CBA_fnc_waitUntilAndExecute;
