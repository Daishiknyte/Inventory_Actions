/*
 * Author: Daishiknyte
 * Sets up variables and event handlers for Inventory_Actions
 *
 * Arguments:
 * 0: primaryContainer <TYPE>
 * 1: secondaryContainer <TYPE>
 *
 * Return Value:
 * <None>
 *
 * Example:
 * [groundContainer, soldierContainer] call FUNC(inventoryOpened);
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_primaryContainer", "_secondaryContainer"];

GVAR(primaryContainer) = _primaryContainer;
GVAR(secondaryContainer) = _secondaryContainer;
GVAR(actionMenuControlID) = 0;
GVAR(actionMenuIndex) = 0;

// Add UI eventHandlers to Inventory dialog controls
{
    (DISPLAY_INVENTORY displayCtrl _x) ctrlAddEventHandler ["MouseButtonUp", {_this call FUNC(handleClickInvList)}];
    (DISPLAY_INVENTORY displayCtrl _x) ctrlAddEventHandler ["LBSelChanged", {[_this, false] call FUNC(handleLBClickInvList)}];
    (DISPLAY_INVENTORY displayCtrl _x) ctrlAddEventHandler ["LBDrag", {call FUNC(handleLBDragInvList)}];
    (DISPLAY_INVENTORY displayCtrl _x) ctrlAddEventHandler ["LBDblClick", {[_this, true] call FUNC(handleLBClickInvList)}];
} forEach [IDC_CONTAINER_UNIFORM, IDC_CONTAINER_VEST, IDC_CONTAINER_BACKPACK, IDC_CONTAINER_GROUND, IDC_CONTAINER_SOLDIER];

// Any click not on one of the above slots, the action box, or btn "esc", should close the action box.
for "_i" from 0 to ((count (configFile >> "RscDisplayInventory" >> "controls")) - 1) do {
    private _path = (configFile >> "RscDisplayInventory" >> "controls") select _i;
    private _idc = getNumber (_path >> "IDC");

    if (!(_idc in [
            IDC_CONTAINER_UNIFORM, IDC_CONTAINER_VEST, IDC_CONTAINER_BACKPACK, IDC_CONTAINER_GROUND, IDC_CONTAINER_SOLDIER,
            IDC_SLOT_UNIFORM, IDC_SLOT_VEST, IDC_SLOT_BACKPACK])) then {
        (DISPLAY_INVENTORY displayCtrl _idc) ctrlAddEventHandler ["MouseButtonDown", {
            systemChat format ["Clicked on other control. Closing : %1", _this];
            call FUNC(actionMenuClose);
        }];
    };
};

false
