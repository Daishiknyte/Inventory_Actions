/*
 * Author: Daishiknyte
 * Closes Action Menu and removes related event handlers.
 *
 * Arguments:
 * <None>
 *
 * Return Value:
 * <None>
 *
 * Example:
 * call ace_inventory_actions_closeActionMenu;
 *
 * Public: Yes
 */

#include "script_component.hpp"

if (FUNC(isActionMenuOpen)) then {
    // Remove eH to prevent accidental clicks/tabbing
    for "_i" from 0 to (MAX_ACTIONS - 1) do {
        (DISPLAY_INVENTORY displayCtrl (IDC_ACTIONS_ACTION_0 + _i)) ctrlRemoveAllEventHandlers "ButtonClick";
        (DISPLAY_INVENTORY displayCtrl (IDC_ACTIONS_ACTION_0 + _i)) ctrlSetText "";
    };
};

// Hide the action menu by shrinking the group to 0 width, 0 height
(DISPLAY_INVENTORY displayCtrl IDC_ACTIONS_GROUP) ctrlSetPosition [0,0,0,0]; // x, y, w, h 
(DISPLAY_INVENTORY displayCtrl IDC_ACTIONS_GROUP) ctrlCommit 0;
