/*
 * Author: Daishiknyte
 * Checks if Action Menu is open based on the menu's dimensions
 *
 * Arguments:
 * <None>
 *
 * Return Value:
 * _isOpen <TYPE>
 *
 * Example:
 * call ace_inventory_actions_isActionMenuOpen;
 *
 * Public: Yes
 */

#include "script_component.hpp"

if (((ctrlPosition (DISPLAY_INVENTORY displayCtrl IDC_ACTIONS_GROUP)) select 3) > 0) then {
    true
} else {
    false
};
