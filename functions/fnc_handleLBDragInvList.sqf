/*
 * Author: Daishiknyte
 * Handle drag event in inventory listboxes
 *
 * Arguments:
 * <None>
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

if (call FUNC(isActionMenuOpen)) exitWith {
    call FUNC(closeActionMenu);
};
