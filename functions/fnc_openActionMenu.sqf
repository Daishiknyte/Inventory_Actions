/*
 * Author: Daishiknyte
 * Core function for opening Action Menu
 *
 * Arguments:
 * 0: _invControl <CONTROL>
 * 1: _invControlIDC <SCALAR>
 * 2: _invIndex <SCALAR>
 *
 * Return Value:
 * <None>
 *
 * Example:
 * ["example"] call ace_[module]_fnc_[functionName]
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_controlClicked", "_controlClickedIDC", "_indexClicked"];

diag_log format ["========================================"];
diag_log format ["INV_ACT : fnc_OpenActionMenu"];
diag_log format ["   Params : %1 | %2 | %3", _controlClicked, _controlClickedIDC, _indexClicked];

// Turn lists returned by inventory commands into one that matches the displayed inventory
    // For now, don't worry about stopping the inventoryData building at the clicked index.
    // Process entire container for comparison purposes.
private _inventoryData = [_controlClickedIDC, _indexClicked] call FUNC(getInventoryData);
private _selectedItem = _inventoryData select _indexClicked;

// Retrieve available actions
private _availableActions = ([_controlClickedIDC, _selectedItem] call FUNC(getItemActions));

// Open the Action Menu
[_controlClickedIDC, _selectedItem, _availableActions] call FUNC(displayActionMenu);
