/*
 * Author: Daishiknyte
 * Handles right clicks on item lists in the inventory.  Closes Action Menu if open.
 *
 * Arguments:
 * 0: _mouseButton <TYPE>
 *
 * Return Value:
 * <None>
 *
 * Example:
 * _this call ace_inventory_actions;
 *
 * Public: Yes
 */

#include "script_component.hpp"

if (_this select 1 == 1) then { // 0 = left, 1 = right
    if (call FUNC(isActionMenuOpen)) then {
        call FUNC(closeActionMenu);
    };
};
