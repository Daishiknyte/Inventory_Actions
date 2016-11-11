/*
 * Author: Daishiknyte
 * Handles detecting single and double click events in inventory listboxes.
 * Double clicks open the menu, single clicks close the menu.
 *
 * Arguments:
 * 0: _that
 *   0: _controlClicked
 *   1: _indexClicked
 * 1: _isDoubleClick
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

params ["_that", "_isDoubleClick"];
_that params ["_invControl", "_invIndex"];

if !(_isDoubleClick) exitWith {
    if !((ctrlIDC _invControl == GVAR(actionMenuControlID)) && (_invIndex == GVAR(actionMenuIndex))) then {
        if (call FUNC(isActionMenuOpen)) then {
            call FUNC(closeActionMenu);
        };
    };
};

// Time to get some Action Menu action going!
GVAR(actionMenuControl) = _controlIDC;
GVAR(actionMenuIndex) = _indexClicked;

diag_log format ["=================================================="];
diag_log format ["Started Action Menu Opening : %1", diag_tickTime];
[_controlClicked, _controlIDC, _indexClicked] call FUNC(openActionMenu);
diag_log format ["Completed Action Menu Opening : %1", diag_tickTime];
diag_log format ["=================================================="];
